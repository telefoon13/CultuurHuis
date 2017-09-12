package be.vdab.repositories;

import be.vdab.enteties.Genre;
import be.vdab.enteties.Performance;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PerformancesRepository extends AbstractRepository {

	private static final String FIND_ALL_GENRES = "SELECT * FROM genres";
	private static final String FIND_GENRE_BY_ID = "SELECT * FROM genres WHERE id = ?";
	private static final String FIND_PERFORMANCE_BY_GENRE = "SELECT * FROM performances WHERE genreid = ?";
	private static final String FIND_PERFORMANCE_BY_ID = "SELECT * FROM performances WHERE id = ?";

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
								resultSet.getDate("date"), resultSet.getLong("genreid"), resultSet.getDouble("price"),
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


}
