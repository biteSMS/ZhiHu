package connectionpool;
import java.util.Date;
import java.text.SimpleDateFormat;


class TimeBack {
    public  String getTimeYMDHMS(){//获得年月日时分秒
            SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss");
            return df.format(new Date());
        }
    }


