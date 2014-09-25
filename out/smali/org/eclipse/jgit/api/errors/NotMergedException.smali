.class public Lorg/eclipse/jgit/api/errors/NotMergedException;
.super Lorg/eclipse/jgit/api/errors/GitAPIException;
.source "NotMergedException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 52
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->notMergedExceptionMessage:Ljava/lang/String;

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/api/errors/GitAPIException;-><init>(Ljava/lang/String;)V

    .line 53
    return-void
.end method
