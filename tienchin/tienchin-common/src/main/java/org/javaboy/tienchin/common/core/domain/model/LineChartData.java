package org.javaboy.tienchin.common.core.domain.model;

import java.util.List;

/**
 * 折线图的数据实体类
 */
public class LineChartData {
    private List<EchartsPoint> increase;
    private List<EchartsPoint> total;

    public List<EchartsPoint> getIncrease() {
        return increase;
    }

    public void setIncrease(List<EchartsPoint> increase) {
        this.increase = increase;
    }

    public List<EchartsPoint> getTotal() {
        return total;
    }

    public void setTotal(List<EchartsPoint> total) {
        this.total = total;
    }
}
