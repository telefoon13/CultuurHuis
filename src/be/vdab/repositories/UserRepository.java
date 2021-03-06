package be.vdab.repositories;

import be.vdab.enteties.User;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;

public class UserRepository extends AbstractRepository {

	private static final String SELECT_USER = "SELECT * FROM users WHERE username = ?";
	private static final String SELECT_USER_BY_EMAIL = "SELECT email FROM users WHERE email = ?";
	private static final String SIGNUP = "INSERT INTO users (prename,lastname,street,streetnr,zipcode,city,username,email,`password`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String SALT = "456?Mike.Dhoore?123";

	private static String generateHash(String input) {
		StringBuilder hash = new StringBuilder();
		try {
			MessageDigest sha = MessageDigest.getInstance("SHA-1");
			byte[] hashedBytes = sha.digest(input.getBytes());
			char[] digits = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
					'a', 'b', 'c', 'd', 'e', 'f'};
			for (byte b : hashedBytes) {
				hash.append(digits[(b & 0xf0) >> 4]);
				hash.append(digits[b & 0x0f]);
			}
		} catch (NoSuchAlgorithmException ex) {
			throw new RepositoryException(ex);
		}
		return hash.toString();
	}

	public boolean checkPass(String username, String password) {
		User user = userExist(username);
		if (user != null) {
			String saltedPassword = SALT + password;
			String hashedPassword = generateHash(saltedPassword);
			return user.getPassword().equals(hashedPassword);
		} else {
			return false;
		}
	}

	public boolean signup(String prename, String lastname, String street, String streetnr, String zipcode, String city, String username, String email, String pass) {
		try (Connection connection = dataSource.getConnection();
			 PreparedStatement statement = connection.prepareStatement(SIGNUP, Statement.RETURN_GENERATED_KEYS)) {
			String saltedPassword = SALT + pass;
			String hashedPassword = generateHash(saltedPassword);
			statement.setString(1, prename);
			statement.setString(2, lastname);
			statement.setString(3, street);
			statement.setString(4, streetnr);
			statement.setString(5, zipcode);
			statement.setString(6, city);
			statement.setString(7, username);
			statement.setString(8, email);
			statement.setString(9, hashedPassword);
			statement.executeUpdate();
			try (ResultSet resultSet = statement.getGeneratedKeys()) {
				return resultSet.next();

			}
		} catch (SQLException ex) {
			throw new RepositoryException(ex);
		}
	}

	public User userExist(String username) {
		try (Connection connection = dataSource.getConnection();
			 PreparedStatement statement = connection.prepareStatement(SELECT_USER)) {
			statement.setString(1, username);
			try (ResultSet resultSet = statement.executeQuery()) {
				if (resultSet.next()) {
					return new User(
							resultSet.getLong("id"),
							resultSet.getString("prename"),
							resultSet.getString("lastname"),
							resultSet.getString("street"),
							resultSet.getString("streetnr"),
							resultSet.getString("zipcode"),
							resultSet.getString("city"),
							resultSet.getString("username"),
							resultSet.getString("email"),
							resultSet.getString("password"));
				} else {
					return null;
				}
			}
		} catch (SQLException ex) {
			throw new RepositoryException(ex);
		}
	}

	public boolean emailExist(String email) {
		try (Connection connection = dataSource.getConnection();
			 PreparedStatement statement = connection.prepareStatement(SELECT_USER_BY_EMAIL)) {
			statement.setString(1, email);
			try (ResultSet resultSet = statement.executeQuery()) {
				return resultSet.next();
			}
		} catch (SQLException ex) {
			throw new RepositoryException(ex);
		}
	}
}