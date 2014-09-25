.class Lorg/eclipse/jgit/gitrepo/RepoCommand$RemoteUnavailableException;
.super Lorg/eclipse/jgit/api/errors/GitAPIException;
.source "RepoCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/gitrepo/RepoCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RemoteUnavailableException"
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 3
    .parameter "uri"

    .prologue
    .line 401
    invoke-static {}, Lorg/eclipse/jgit/gitrepo/internal/RepoText;->get()Lorg/eclipse/jgit/gitrepo/internal/RepoText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/internal/RepoText;->errorRemoteUnavailable:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/api/errors/GitAPIException;-><init>(Ljava/lang/String;)V

    .line 402
    return-void
.end method
