package be.vdab.repositories;

import be.vdab.enteties.Genre;
import be.vdab.enteties.Performance;
import be.vdab.enteties.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PerformancesRepository extends AbstractRepository {

	private static final String FIND_ALL_GENRES = "SELECT * FROM genres";
	private static final String FIND_GENRE_BY_ID = "SELECT * FROM genres WHERE id = ?";
	private static final String FIND_PERFORMANCE_BY_GENRE = "SELECT * FROM performances WHERE genreid = ? AND date >= NOW() ORDER BY date ASC ";
	private static final String FIND_PERFORMANCE_BY_ID = "SELECT * FROM performances WHERE id = ?";
	private static final String INSERT = "INSERT INTO reservations (userid,performanceid,seats) VALUES (?, ?, ?);";
	private static final String UPDATE = "UPDATE performances SET freeseats=freeseats-? WHERE id=?";

	public List<Genre> findAllGenres(){
		try(Connection connection = dataSource.getConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(FIND_ALL_GENRES)) {
			List<Genre> genres = new ArrayList<>();
			for (long vorigeId = 0; resultSet.next();) {
				long id = resultSet.getLong("id");
				if (id != vorigeId) {
					genres.add(new Genre(resultSet.getLong("id"), resultSet.getString("name")));
					vorigeId = id;
				}
			}
			return genres;
		} catch (SQLException ex) {
			throw new RepositoryException(ex);
		}
	}

	public List<Performance> findPerformanceByGenre(long genreid){
		try (Connection connection = dataSource.getConnection();
			 PreparedStatement statement = connection.prepareStatement(FIND_PERFORMANCE_BY_GENRE)) {
			statement.setLong(1, genreid);
			try (ResultSet resultSet = statement.executeQuery()) {
				List<Performance> performances = new ArrayList<>();
				for (long vorigeId = 0; resultSet.next();) {
					long id = resultSet.getLong("id");
					if (id != vorigeId) {
						performances.add(new Performance(resultSet.getLong("id"), resultSet.getString("title"), resultSet.getString("performers"),
								resultSet.getString("date"), resultSet.getLong("genreid"), resultSet.getDouble("price"),
								resultSet.getInt("freeseats")));
						vorigeId = id;
					}
				}
				return performances;
			}
		} catch (SQLException ex) {
			throw new RepositoryException(ex);
		}
	}

	public String findGenreById(long id){
		try (Connection connection = dataSource.getConnection();
			 PreparedStatement statement = connection.prepareStatement(FIND_GENRE_BY_ID)) {
			statement.setLong(1, id);
			try (ResultSet resultSet = statement.executeQuery()) {
				if (resultSet.next()) {
					return resultSet.getString("name");
				} else {
					return null;
				}
			}
		} catch (SQLException ex) {
			throw new RepositoryException(ex);
		}
	}

	public Performance findPerformanceById(long id){
		try (Connection connection = dataSource.getConnection();
			 PreparedStatement statement = connection.prepareStatement(FIND_PERFORMANCE_BY_ID)) {
			statement.setLong(1, id);
			try (ResultSet resultSet = statement.executeQuery()) {
				if (resultSet.next()) {
					return new Performance(resultSet.getLong("id"), resultSet.getString("title"), resultSet.getString("performers"),
							resultSet.getString("date"), resultSet.getLong("genreid"), resultSet.getDouble("price"),
							resultSet.getInt("freeseats"));
				} else {
					return null;
				}
			}
		} catch (SQLException ex) {
			throw new RepositoryException(ex);
		}
	}

	public boolean confirmTickets(long userid, long performanceid, long seats){
		try (Connection connection = dataSource.getConnection();
			 PreparedStatement statement = connection.prepareStatement(INSERT, Statement.RETURN_GENERATED_KEYS);
			 PreparedStatement statement2 = connection.prepareStatement(UPDATE, Statement.RETURN_GENERATED_KEYS)) {
			statement.setLong(1,userid);
			statement.setLong(2,performanceid);
			statement.setLong(3,seats);
			statement2.setLong(1,seats);
			statement2.setLong(2,performanceid);
			statement.executeUpdate();
			statement2.executeUpdate();
			try (ResultSet resultSet = statement.getGeneratedKeys();
				 ResultSet resultSet2 = statement2.getGeneratedKeys()) {
				resultSet.next();
				resultSet2.next();
				return true;
			}
		} catch (SQLException ex) {
			return false;
		}
	}


}
