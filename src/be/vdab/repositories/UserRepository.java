package be.vdab.repositories;

import be.vdab.enteties.User;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserRepository extends AbstractRepository {

	private static final String SELECT_USER = "SELECT * FROM users WHERE gebruikersnaam = ?";
	private static final String SELECT_USER_BY_EMAIL = "SELECT email FROM users WHERE email = ?";
	private static final String SIGNUP = "INSERT INTO users (gebruikersnaam,email,pass) VALUES (?, ?, ?)";
	private final static Logger LOGGER = Logger.getLogger(UserRepository.class.getName());
	private static final String SALT = "456?Mike.Dhoore?123";

	public boolean checkPass(String gebruikersnaam, String password){
		User user = userExist(gebruikersnaam);
		if (user != null) {
			String saltedPassword = SALT + password;
			String hashedPassword = generateHash(saltedPassword);
			if (user.getPass().equals(hashedPassword)) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	public boolean signup(String gebruikersnaam, String email, String pass){
		try (Connection connection = dataSource.getConnection();
			 PreparedStatement statement = connection.prepareStatement(SIGNUP, Statement.RETURN_GENERATED_KEYS)) {
			String saltedPassword = SALT + pass;
			String hashedPassword = generateHash(saltedPassword);
			statement.setString(1, gebruikersnaam);
			statement.setString(2, email);
			statement.setString(3, hashedPassword);
			statement.executeUpdate();
			try (ResultSet resultSet = statement.getGeneratedKeys()) {
				resultSet.next();
				return true;
			}
		} catch (SQLException ex) {
			LOGGER.log(Level.SEVERE, "DB probleem (signup)", ex);
			throw new RepositoryException(ex);
		}
	}

	public User userExist(String gebruikersnaam){
		try (Connection connection = dataSource.getConnection();
			 PreparedStatement statement = connection.prepareStatement(SELECT_USER)) {
				statement.setString(1, gebruikersnaam);
				try (ResultSet resultSet = statement.executeQuery()) {
					if (resultSet.next()) {
						return new User(resultSet.getLong("id"), resultSet.getString("gebruikersnaam"),
								resultSet.getString("email"), resultSet.getString("pass"));
					} else {
						return null;
				}
			}
		} catch (SQLException ex) {
			LOGGER.log(Level.SEVERE,"DB probleem(UserExist)",ex);
			throw new RepositoryException(ex);
		}
	}

	public boolean emailExist(String email){
		try (Connection connection = dataSource.getConnection();
			 PreparedStatement statement = connection.prepareStatement(SELECT_USER_BY_EMAIL)) {
			statement.setString(1, email);
			try (ResultSet resultSet = statement.executeQuery()) {
				if (resultSet.next()) {
					return true;
				} else {
					return false;
				}
			}
		} catch (SQLException ex) {
			LOGGER.log(Level.SEVERE,"DB probleem(UserExist)",ex);
			throw new RepositoryException(ex);
		}
	}

	private static String generateHash(String input) {
		StringBuilder hash = new StringBuilder();

		try {
			MessageDigest sha = MessageDigest.getInstance("SHA-1");
			byte[] hashedBytes = sha.digest(input.getBytes());
			char[] digits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
					'a', 'b', 'c', 'd', 'e', 'f' };
			for (int idx = 0; idx < hashedBytes.length; ++idx) {
				byte b = hashedBytes[idx];
				hash.append(digits[(b & 0xf0) >> 4]);
				hash.append(digits[b & 0x0f]);
			}
		} catch (NoSuchAlgorithmException ex) {
			LOGGER.log(Level.SEVERE,"Hash probleem",ex);
			throw new RepositoryException(ex);
		}
		return hash.toString();
	}

}
