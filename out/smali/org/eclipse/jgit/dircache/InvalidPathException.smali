.class public Lorg/eclipse/jgit/dircache/InvalidPathException;
.super Ljava/lang/IllegalArgumentException;
.source "InvalidPathException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 3
    .parameter "path"

    .prologue
    .line 63
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->invalidPath:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/dircache/InvalidPathException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 64
    return-void
.end method

.method varargs constructor <init>(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1
    .parameter "messagePattern"
    .parameter "arguments"

    .prologue
    .line 67
    invoke-static {p1, p2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 68
    return-void
.end method
