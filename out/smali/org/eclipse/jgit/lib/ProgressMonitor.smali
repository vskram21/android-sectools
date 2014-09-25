.class public interface abstract Lorg/eclipse/jgit/lib/ProgressMonitor;
.super Ljava/lang/Object;
.source "ProgressMonitor.java"


# static fields
.field public static final UNKNOWN:I


# virtual methods
.method public abstract beginTask(Ljava/lang/String;I)V
.end method

.method public abstract endTask()V
.end method

.method public abstract isCancelled()Z
.end method

.method public abstract start(I)V
.end method

.method public abstract update(I)V
.end method
