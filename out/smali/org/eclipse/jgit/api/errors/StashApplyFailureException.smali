.class public Lorg/eclipse/jgit/api/errors/StashApplyFailureException;
.super Lorg/eclipse/jgit/api/errors/GitAPIException;
.source "StashApplyFailureException.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "message"

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/errors/GitAPIException;-><init>(Ljava/lang/String;)V

    .line 17
    return-void
.end method
