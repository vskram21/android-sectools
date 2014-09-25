.class public Lorg/eclipse/jgit/api/errors/InvalidRebaseStepException;
.super Lorg/eclipse/jgit/api/errors/GitAPIException;
.source "InvalidRebaseStepException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "msg"

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/errors/GitAPIException;-><init>(Ljava/lang/String;)V

    .line 53
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .parameter "msg"
    .parameter "cause"

    .prologue
    .line 60
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/api/errors/GitAPIException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 61
    return-void
.end method
