package com.kou.monitor.domain.model.entity;

import lombok.*;

import java.util.List;

/**
 * @author KouJY
 * @description
 * @create 2024-10-07 22:50
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MonitorFlowDesignerEntity {

    private String monitorId;

    private List<Node> nodeList;

    private List<Link> linkList;

    @Getter
    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    public static class Node {
        // 节点ID
        private String monitorNodeId;
        // 节点坐标
        private String loc;
    }

    @Getter
    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    public static class Link {
        private String from;
        private String to;
        private String key;
        private String text;
    }
}
