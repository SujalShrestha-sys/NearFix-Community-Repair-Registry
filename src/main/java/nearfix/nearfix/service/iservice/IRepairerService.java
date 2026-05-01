package nearfix.nearfix.service.iservice;

import nearfix.nearfix.model.Repairer;
import nearfix.nearfix.exception.ValidationException;
import java.sql.SQLException;

public interface IRepairerService {
    Repairer getRepairerProfile(int repairerId) throws SQLException;
    boolean updateProfile(Repairer repairer) throws SQLException, ValidationException;
}
