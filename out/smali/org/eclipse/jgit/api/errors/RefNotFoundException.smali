.class public Lorg/eclipse/jgit/api/errors/RefNotFoundException;
.super Lorg/eclipse/jgit/api/errors/GitAPIException;
.source "RefNotFoundException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "message"

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/errors/GitAPIException;-><init>(Ljava/lang/String;)V

    .line 51
    return-void
.end method
