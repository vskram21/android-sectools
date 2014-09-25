.class public Lorg/eclipse/jgit/api/errors/InvalidTagNameException;
.super Lorg/eclipse/jgit/api/errors/GitAPIException;
.source "InvalidTagNameException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "msg"

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/errors/GitAPIException;-><init>(Ljava/lang/String;)V

    .line 52
    return-void
.end method
