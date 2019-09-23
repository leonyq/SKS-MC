package com.morelean.sap.comm;

public interface IMultiStepJob {
    boolean runNextStep();

    String getName();

    void cleanUp();
}
