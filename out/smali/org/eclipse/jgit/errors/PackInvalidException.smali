.class public Lorg/eclipse/jgit/errors/PackInvalidException;
.super Ljava/io/IOException;
.source "PackInvalidException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .parameter "path"

    .prologue
    .line 63
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/errors/PackInvalidException;-><init>(Ljava/lang/String;)V

    .line 64
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 3
    .parameter "path"

    .prologue
    .line 73
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->packFileInvalid:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 74
    return-void
.end method
