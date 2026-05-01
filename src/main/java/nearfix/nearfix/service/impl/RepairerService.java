package nearfix.nearfix.service.impl;

import nearfix.nearfix.dao.impl.RepairerDAO;
import nearfix.nearfix.exception.ValidationException;
import nearfix.nearfix.model.Repairer;
import nearfix.nearfix.service.iservice.IRepairerService;

import java.sql.SQLException;

public class RepairerService implements IRepairerService {

    private final RepairerDAO repairerDAO = new RepairerDAO();

    @Override
    public Repairer getRepairerProfile(int repairerId) throws SQLException {
        return repairerDAO.getRepairerById(repairerId);
    }

    @Override
    public boolean updateProfile(Repairer repairer) throws SQLException, ValidationException {
        if (repairer.getName() == null || repairer.getName().trim().isEmpty()) {
            throw new ValidationException("Name is required.");
        }
        return repairerDAO.updateRepairer(repairer);
    }
}
