.class public Lorg/eclipse/jgit/errors/RepositoryNotFoundException;
.super Lorg/eclipse/jgit/errors/TransportException;
.source "RepositoryNotFoundException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .parameter "location"

    .prologue
    .line 62
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/errors/RepositoryNotFoundException;-><init>(Ljava/lang/String;)V

    .line 63
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/lang/Throwable;)V
    .locals 1
    .parameter "location"
    .parameter "why"

    .prologue
    .line 74
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lorg/eclipse/jgit/errors/RepositoryNotFoundException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 75
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "location"

    .prologue
    .line 84
    invoke-static {p1}, Lorg/eclipse/jgit/errors/RepositoryNotFoundException;->message(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;)V

    .line 85
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .parameter "location"
    .parameter "why"

    .prologue
    .line 96
    invoke-static {p1}, Lorg/eclipse/jgit/errors/RepositoryNotFoundException;->message(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 97
    return-void
.end method

.method private static message(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "location"

    .prologue
    .line 100
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->repositoryNotFound:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    invoke-static {v0, v1}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
