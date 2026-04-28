package nearfix.nearfix.dao.idao;


import nearfix.nearfix.model.Repairer;

import java.sql.SQLException;
import java.util.List;

public interface IRepairerDAO {
    boolean createRepairer(Repairer repairer) throws SQLException;

    Repairer getRepairerById(int repairerId) throws SQLException;

    Repairer getRepairerByEmail(String email) throws SQLException;

    List<Repairer> getRepairersBySpecialization(String specialization) throws SQLException;

    List<Repairer> getVerifiedRepairers(int page, int pageSize) throws SQLException;

    boolean updateRepairer(Repairer repairer) throws SQLException;

    boolean updateRepairerRating(int repairerId, double newRating) throws SQLException;

    boolean updateJobsCompleted(int repairerId, int count) throws SQLException;

    boolean verifyRepairer(int repairerId) throws SQLException;

    List<Repairer> searchRepairers(String keyword) throws SQLException;

    int getTotalRepairers() throws SQLException;

    int getTotalVerifiedRepairers() throws SQLException;
}