.class public abstract Lorg/eclipse/jgit/lib/EmptyProgressMonitor;
.super Ljava/lang/Object;
.source "EmptyProgressMonitor.java"

# interfaces
.implements Lorg/eclipse/jgit/lib/ProgressMonitor;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public beginTask(Ljava/lang/String;I)V
    .locals 0
    .parameter "title"
    .parameter "totalWork"

    .prologue
    .line 60
    return-void
.end method

.method public endTask()V
    .locals 0

    .prologue
    .line 68
    return-void
.end method

.method public isCancelled()Z
    .locals 1

    .prologue
    .line 71
    const/4 v0, 0x0

    return v0
.end method

.method public start(I)V
    .locals 0
    .parameter "totalTasks"

    .prologue
    .line 56
    return-void
.end method

.method public update(I)V
    .locals 0
    .parameter "completed"

    .prologue
    .line 64
    return-void
.end method
