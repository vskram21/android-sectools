.class Lorg/eclipse/jgit/gitrepo/RepoCommand$ManifestErrorException;
.super Lorg/eclipse/jgit/api/errors/GitAPIException;
.source "RepoCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/gitrepo/RepoCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ManifestErrorException"
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/Throwable;)V
    .locals 1
    .parameter "cause"

    .prologue
    .line 395
    invoke-static {}, Lorg/eclipse/jgit/gitrepo/internal/RepoText;->get()Lorg/eclipse/jgit/gitrepo/internal/RepoText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/internal/RepoText;->invalidManifest:Ljava/lang/String;

    invoke-direct {p0, v0, p1}, Lorg/eclipse/jgit/api/errors/GitAPIException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 396
    return-void
.end method
