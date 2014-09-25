.class public Lorg/eclipse/jgit/api/errors/MultipleParentsNotAllowedException;
.super Lorg/eclipse/jgit/api/errors/GitAPIException;
.source "MultipleParentsNotAllowedException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "message"

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/errors/GitAPIException;-><init>(Ljava/lang/String;)V

    .line 64
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .parameter "message"
    .parameter "cause"

    .prologue
    .line 56
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/api/errors/GitAPIException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 57
    return-void
.end method
