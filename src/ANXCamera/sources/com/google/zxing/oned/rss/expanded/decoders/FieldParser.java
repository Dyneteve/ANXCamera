package com.google.zxing.oned.rss.expanded.decoders;

import com.android.camera.data.data.runing.ComponentRunningShine;
import com.google.zxing.NotFoundException;

final class FieldParser {
    private static final Object[][] FOUR_DIGIT_DATA_LENGTH = {new Object[]{"7001", Integer.valueOf(13)}, new Object[]{"7002", VARIABLE_LENGTH, Integer.valueOf(30)}, new Object[]{"7003", Integer.valueOf(10)}, new Object[]{"8001", Integer.valueOf(14)}, new Object[]{"8002", VARIABLE_LENGTH, Integer.valueOf(20)}, new Object[]{"8003", VARIABLE_LENGTH, Integer.valueOf(30)}, new Object[]{"8004", VARIABLE_LENGTH, Integer.valueOf(30)}, new Object[]{"8005", Integer.valueOf(6)}, new Object[]{"8006", Integer.valueOf(18)}, new Object[]{"8007", VARIABLE_LENGTH, Integer.valueOf(30)}, new Object[]{"8008", VARIABLE_LENGTH, Integer.valueOf(12)}, new Object[]{"8018", Integer.valueOf(18)}, new Object[]{"8020", VARIABLE_LENGTH, Integer.valueOf(25)}, new Object[]{"8100", Integer.valueOf(6)}, new Object[]{"8101", Integer.valueOf(10)}, new Object[]{"8102", Integer.valueOf(2)}, new Object[]{"8110", VARIABLE_LENGTH, Integer.valueOf(70)}, new Object[]{"8200", VARIABLE_LENGTH, Integer.valueOf(70)}};
    private static final Object[][] THREE_DIGIT_DATA_LENGTH = {new Object[]{"240", VARIABLE_LENGTH, Integer.valueOf(30)}, new Object[]{"241", VARIABLE_LENGTH, Integer.valueOf(30)}, new Object[]{"242", VARIABLE_LENGTH, Integer.valueOf(6)}, new Object[]{"250", VARIABLE_LENGTH, Integer.valueOf(30)}, new Object[]{"251", VARIABLE_LENGTH, Integer.valueOf(30)}, new Object[]{"253", VARIABLE_LENGTH, Integer.valueOf(17)}, new Object[]{"254", VARIABLE_LENGTH, Integer.valueOf(20)}, new Object[]{"400", VARIABLE_LENGTH, Integer.valueOf(30)}, new Object[]{"401", VARIABLE_LENGTH, Integer.valueOf(30)}, new Object[]{"402", Integer.valueOf(17)}, new Object[]{"403", VARIABLE_LENGTH, Integer.valueOf(30)}, new Object[]{"410", Integer.valueOf(13)}, new Object[]{"411", Integer.valueOf(13)}, new Object[]{"412", Integer.valueOf(13)}, new Object[]{"413", Integer.valueOf(13)}, new Object[]{"414", Integer.valueOf(13)}, new Object[]{"420", VARIABLE_LENGTH, Integer.valueOf(20)}, new Object[]{"421", VARIABLE_LENGTH, Integer.valueOf(15)}, new Object[]{"422", Integer.valueOf(3)}, new Object[]{"423", VARIABLE_LENGTH, Integer.valueOf(15)}, new Object[]{"424", Integer.valueOf(3)}, new Object[]{"425", Integer.valueOf(3)}, new Object[]{"426", Integer.valueOf(3)}};
    private static final Object[][] THREE_DIGIT_PLUS_DIGIT_DATA_LENGTH = {new Object[]{"310", Integer.valueOf(6)}, new Object[]{"311", Integer.valueOf(6)}, new Object[]{"312", Integer.valueOf(6)}, new Object[]{"313", Integer.valueOf(6)}, new Object[]{"314", Integer.valueOf(6)}, new Object[]{"315", Integer.valueOf(6)}, new Object[]{"316", Integer.valueOf(6)}, new Object[]{"320", Integer.valueOf(6)}, new Object[]{"321", Integer.valueOf(6)}, new Object[]{"322", Integer.valueOf(6)}, new Object[]{"323", Integer.valueOf(6)}, new Object[]{"324", Integer.valueOf(6)}, new Object[]{"325", Integer.valueOf(6)}, new Object[]{"326", Integer.valueOf(6)}, new Object[]{"327", Integer.valueOf(6)}, new Object[]{"328", Integer.valueOf(6)}, new Object[]{"329", Integer.valueOf(6)}, new Object[]{"330", Integer.valueOf(6)}, new Object[]{"331", Integer.valueOf(6)}, new Object[]{"332", Integer.valueOf(6)}, new Object[]{"333", Integer.valueOf(6)}, new Object[]{"334", Integer.valueOf(6)}, new Object[]{"335", Integer.valueOf(6)}, new Object[]{"336", Integer.valueOf(6)}, new Object[]{"340", Integer.valueOf(6)}, new Object[]{"341", Integer.valueOf(6)}, new Object[]{"342", Integer.valueOf(6)}, new Object[]{"343", Integer.valueOf(6)}, new Object[]{"344", Integer.valueOf(6)}, new Object[]{"345", Integer.valueOf(6)}, new Object[]{"346", Integer.valueOf(6)}, new Object[]{"347", Integer.valueOf(6)}, new Object[]{"348", Integer.valueOf(6)}, new Object[]{"349", Integer.valueOf(6)}, new Object[]{"350", Integer.valueOf(6)}, new Object[]{"351", Integer.valueOf(6)}, new Object[]{"352", Integer.valueOf(6)}, new Object[]{"353", Integer.valueOf(6)}, new Object[]{"354", Integer.valueOf(6)}, new Object[]{"355", Integer.valueOf(6)}, new Object[]{"356", Integer.valueOf(6)}, new Object[]{"357", Integer.valueOf(6)}, new Object[]{"360", Integer.valueOf(6)}, new Object[]{"361", Integer.valueOf(6)}, new Object[]{"362", Integer.valueOf(6)}, new Object[]{"363", Integer.valueOf(6)}, new Object[]{"364", Integer.valueOf(6)}, new Object[]{"365", Integer.valueOf(6)}, new Object[]{"366", Integer.valueOf(6)}, new Object[]{"367", Integer.valueOf(6)}, new Object[]{"368", Integer.valueOf(6)}, new Object[]{"369", Integer.valueOf(6)}, new Object[]{"390", VARIABLE_LENGTH, Integer.valueOf(15)}, new Object[]{"391", VARIABLE_LENGTH, Integer.valueOf(18)}, new Object[]{"392", VARIABLE_LENGTH, Integer.valueOf(15)}, new Object[]{"393", VARIABLE_LENGTH, Integer.valueOf(18)}, new Object[]{"703", VARIABLE_LENGTH, Integer.valueOf(30)}};
    private static final Object[][] TWO_DIGIT_DATA_LENGTH = {new Object[]{"00", Integer.valueOf(18)}, new Object[]{"01", Integer.valueOf(14)}, new Object[]{"02", Integer.valueOf(14)}, new Object[]{"10", VARIABLE_LENGTH, Integer.valueOf(20)}, new Object[]{ComponentRunningShine.SHINE_LIVE_BEAUTY, Integer.valueOf(6)}, new Object[]{"12", Integer.valueOf(6)}, new Object[]{"13", Integer.valueOf(6)}, new Object[]{"15", Integer.valueOf(6)}, new Object[]{"17", Integer.valueOf(6)}, new Object[]{"20", Integer.valueOf(2)}, new Object[]{"21", VARIABLE_LENGTH, Integer.valueOf(20)}, new Object[]{"22", VARIABLE_LENGTH, Integer.valueOf(29)}, new Object[]{"30", VARIABLE_LENGTH, Integer.valueOf(8)}, new Object[]{"37", VARIABLE_LENGTH, Integer.valueOf(8)}, new Object[]{"90", VARIABLE_LENGTH, Integer.valueOf(30)}, new Object[]{"91", VARIABLE_LENGTH, Integer.valueOf(30)}, new Object[]{"92", VARIABLE_LENGTH, Integer.valueOf(30)}, new Object[]{"93", VARIABLE_LENGTH, Integer.valueOf(30)}, new Object[]{"94", VARIABLE_LENGTH, Integer.valueOf(30)}, new Object[]{"95", VARIABLE_LENGTH, Integer.valueOf(30)}, new Object[]{"96", VARIABLE_LENGTH, Integer.valueOf(30)}, new Object[]{"97", VARIABLE_LENGTH, Integer.valueOf(30)}, new Object[]{"98", VARIABLE_LENGTH, Integer.valueOf(30)}, new Object[]{"99", VARIABLE_LENGTH, Integer.valueOf(30)}};
    private static final Object VARIABLE_LENGTH = new Object();

    private FieldParser() {
    }

    static String parseFieldsInGeneralPurpose(String rawInformation) throws NotFoundException {
        if (rawInformation.isEmpty()) {
            return null;
        }
        if (rawInformation.length() >= 2) {
            String firstTwoDigits = rawInformation.substring(0, 2);
            Object[][] objArr = TWO_DIGIT_DATA_LENGTH;
            int length = objArr.length;
            int i = 0;
            while (i < length) {
                Object[] dataLength = objArr[i];
                if (!dataLength[0].equals(firstTwoDigits)) {
                    i++;
                } else if (dataLength[1] == VARIABLE_LENGTH) {
                    return processVariableAI(2, ((Integer) dataLength[2]).intValue(), rawInformation);
                } else {
                    return processFixedAI(2, ((Integer) dataLength[1]).intValue(), rawInformation);
                }
            }
            if (rawInformation.length() >= 3) {
                String firstThreeDigits = rawInformation.substring(0, 3);
                Object[][] objArr2 = THREE_DIGIT_DATA_LENGTH;
                int length2 = objArr2.length;
                int i2 = 0;
                while (i2 < length2) {
                    Object[] dataLength2 = objArr2[i2];
                    if (!dataLength2[0].equals(firstThreeDigits)) {
                        i2++;
                    } else if (dataLength2[1] == VARIABLE_LENGTH) {
                        return processVariableAI(3, ((Integer) dataLength2[2]).intValue(), rawInformation);
                    } else {
                        return processFixedAI(3, ((Integer) dataLength2[1]).intValue(), rawInformation);
                    }
                }
                Object[][] objArr3 = THREE_DIGIT_PLUS_DIGIT_DATA_LENGTH;
                int length3 = objArr3.length;
                int i3 = 0;
                while (i3 < length3) {
                    Object[] dataLength3 = objArr3[i3];
                    if (!dataLength3[0].equals(firstThreeDigits)) {
                        i3++;
                    } else if (dataLength3[1] == VARIABLE_LENGTH) {
                        return processVariableAI(4, ((Integer) dataLength3[2]).intValue(), rawInformation);
                    } else {
                        return processFixedAI(4, ((Integer) dataLength3[1]).intValue(), rawInformation);
                    }
                }
                if (rawInformation.length() >= 4) {
                    String firstFourDigits = rawInformation.substring(0, 4);
                    Object[][] objArr4 = FOUR_DIGIT_DATA_LENGTH;
                    int length4 = objArr4.length;
                    int i4 = 0;
                    while (i4 < length4) {
                        Object[] dataLength4 = objArr4[i4];
                        if (!dataLength4[0].equals(firstFourDigits)) {
                            i4++;
                        } else if (dataLength4[1] == VARIABLE_LENGTH) {
                            return processVariableAI(4, ((Integer) dataLength4[2]).intValue(), rawInformation);
                        } else {
                            return processFixedAI(4, ((Integer) dataLength4[1]).intValue(), rawInformation);
                        }
                    }
                    throw NotFoundException.getNotFoundInstance();
                }
                throw NotFoundException.getNotFoundInstance();
            }
            throw NotFoundException.getNotFoundInstance();
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static String processFixedAI(int aiSize, int fieldSize, String rawInformation) throws NotFoundException {
        if (rawInformation.length() >= aiSize) {
            String ai = rawInformation.substring(0, aiSize);
            if (rawInformation.length() >= aiSize + fieldSize) {
                String field = rawInformation.substring(aiSize, aiSize + fieldSize);
                String remaining = rawInformation.substring(aiSize + fieldSize);
                StringBuilder sb = new StringBuilder(String.valueOf('('));
                sb.append(ai);
                sb.append(')');
                sb.append(field);
                String result = sb.toString();
                String parsedAI = parseFieldsInGeneralPurpose(remaining);
                if (parsedAI == null) {
                    return result;
                }
                StringBuilder sb2 = new StringBuilder(String.valueOf(result));
                sb2.append(parsedAI);
                return sb2.toString();
            }
            throw NotFoundException.getNotFoundInstance();
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static String processVariableAI(int aiSize, int variableFieldSize, String rawInformation) throws NotFoundException {
        int maxSize;
        String ai = rawInformation.substring(0, aiSize);
        if (rawInformation.length() < aiSize + variableFieldSize) {
            maxSize = rawInformation.length();
        } else {
            maxSize = aiSize + variableFieldSize;
        }
        String field = rawInformation.substring(aiSize, maxSize);
        String remaining = rawInformation.substring(maxSize);
        StringBuilder sb = new StringBuilder(String.valueOf('('));
        sb.append(ai);
        sb.append(')');
        sb.append(field);
        String result = sb.toString();
        String parsedAI = parseFieldsInGeneralPurpose(remaining);
        if (parsedAI == null) {
            return result;
        }
        StringBuilder sb2 = new StringBuilder(String.valueOf(result));
        sb2.append(parsedAI);
        return sb2.toString();
    }
}
