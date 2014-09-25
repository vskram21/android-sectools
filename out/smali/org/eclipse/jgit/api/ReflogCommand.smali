.class public Lorg/eclipse/jgit/api/ReflogCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "ReflogCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Ljava/util/Collection",
        "<",
        "Lorg/eclipse/jgit/lib/ReflogEntry;",
        ">;>;"
    }
.end annotation


# instance fields
.field private ref:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 72
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 66
    const-string v0, "HEAD"

    iput-object v0, p0, Lorg/eclipse/jgit/api/ReflogCommand;->ref:Ljava/lang/String;

    .line 73
    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 64
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/ReflogCommand;->call()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/util/Collection;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/ReflogEntry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Lorg/eclipse/jgit/api/errors/InvalidRefNameException;
        }
    .end annotation

    .prologue
    .line 96
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/ReflogCommand;->checkCallable()V

    .line 99
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/api/ReflogCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    iget-object v3, p0, Lorg/eclipse/jgit/api/ReflogCommand;->ref:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/Repository;->getReflogReader(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ReflogReader;

    move-result-object v1

    .line 100
    .local v1, reader:Lorg/eclipse/jgit/lib/ReflogReader;
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/ReflogReader;->getReverseEntries()Ljava/util/List;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    return-object v2

    .line 101
    .end local v1           #reader:Lorg/eclipse/jgit/lib/ReflogReader;
    :catch_0
    move-exception v0

    .line 102
    .local v0, e:Ljava/io/IOException;
    new-instance v2, Lorg/eclipse/jgit/api/errors/InvalidRefNameException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->cannotRead:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lorg/eclipse/jgit/api/ReflogCommand;->ref:Ljava/lang/String;

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lorg/eclipse/jgit/api/errors/InvalidRefNameException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public setRef(Ljava/lang/String;)Lorg/eclipse/jgit/api/ReflogCommand;
    .locals 0
    .parameter "ref"

    .prologue
    .line 83
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/ReflogCommand;->checkCallable()V

    .line 84
    iput-object p1, p0, Lorg/eclipse/jgit/api/ReflogCommand;->ref:Ljava/lang/String;

    .line 85
    return-object p0
.end method
