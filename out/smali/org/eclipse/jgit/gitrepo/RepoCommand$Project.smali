.class Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;
.super Ljava/lang/Object;
.source "RepoCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/gitrepo/RepoCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Project"
.end annotation


# instance fields
.field final copyfiles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;",
            ">;"
        }
    .end annotation
.end field

.field final groups:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final name:Ljava/lang/String;

.field final path:Ljava/lang/String;

.field final revision:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "name"
    .parameter "path"
    .parameter "revision"
    .parameter "groups"

    .prologue
    .line 239
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 240
    iput-object p1, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;->name:Ljava/lang/String;

    .line 241
    iput-object p2, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;->path:Ljava/lang/String;

    .line 242
    iput-object p3, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;->revision:Ljava/lang/String;

    .line 243
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;->groups:Ljava/util/Set;

    .line 244
    if-eqz p4, :cond_0

    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 245
    iget-object v0, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;->groups:Ljava/util/Set;

    const-string v1, ","

    invoke-virtual {p4, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 246
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;->copyfiles:Ljava/util/List;

    .line 247
    return-void
.end method


# virtual methods
.method addCopyFile(Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;)V
    .locals 1
    .parameter "copyfile"

    .prologue
    .line 250
    iget-object v0, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;->copyfiles:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 251
    return-void
.end method
