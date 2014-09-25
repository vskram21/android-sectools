.class public Lorg/eclipse/jgit/revwalk/FollowFilter;
.super Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
.source "FollowFilter.java"


# instance fields
.field final cfg:Lorg/eclipse/jgit/diff/DiffConfig;

.field private final path:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

.field private renameCallback:Lorg/eclipse/jgit/revwalk/RenameCallback;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/treewalk/filter/PathFilter;Lorg/eclipse/jgit/diff/DiffConfig;)V
    .locals 0
    .parameter "path"
    .parameter "cfg"

    .prologue
    .line 97
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;-><init>()V

    .line 98
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/FollowFilter;->path:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    .line 99
    iput-object p2, p0, Lorg/eclipse/jgit/revwalk/FollowFilter;->cfg:Lorg/eclipse/jgit/diff/DiffConfig;

    .line 100
    return-void
.end method

.method public static create(Ljava/lang/String;Lorg/eclipse/jgit/diff/DiffConfig;)Lorg/eclipse/jgit/revwalk/FollowFilter;
    .locals 2
    .parameter "path"
    .parameter "cfg"

    .prologue
    .line 89
    new-instance v0, Lorg/eclipse/jgit/revwalk/FollowFilter;

    invoke-static {p0}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->create(Ljava/lang/String;)Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lorg/eclipse/jgit/revwalk/FollowFilter;-><init>(Lorg/eclipse/jgit/treewalk/filter/PathFilter;Lorg/eclipse/jgit/diff/DiffConfig;)V

    return-object v0
.end method


# virtual methods
.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 67
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/FollowFilter;->clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    .locals 3

    .prologue
    .line 121
    new-instance v0, Lorg/eclipse/jgit/revwalk/FollowFilter;

    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/FollowFilter;->path:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->clone()Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/FollowFilter;->cfg:Lorg/eclipse/jgit/diff/DiffConfig;

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/revwalk/FollowFilter;-><init>(Lorg/eclipse/jgit/treewalk/filter/PathFilter;Lorg/eclipse/jgit/diff/DiffConfig;)V

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/FollowFilter;->path:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->getPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRenameCallback()Lorg/eclipse/jgit/revwalk/RenameCallback;
    .locals 1

    .prologue
    .line 137
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/FollowFilter;->renameCallback:Lorg/eclipse/jgit/revwalk/RenameCallback;

    return-object v0
.end method

.method public include(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z
    .locals 1
    .parameter "walker"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/FollowFilter;->path:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->include(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lorg/eclipse/jgit/revwalk/FollowFilter;->ANY_DIFF:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->include(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setRenameCallback(Lorg/eclipse/jgit/revwalk/RenameCallback;)V
    .locals 0
    .parameter "callback"

    .prologue
    .line 147
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/FollowFilter;->renameCallback:Lorg/eclipse/jgit/revwalk/RenameCallback;

    .line 148
    return-void
.end method

.method public shouldBeRecursive()Z
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/FollowFilter;->path:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->shouldBeRecursive()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lorg/eclipse/jgit/revwalk/FollowFilter;->ANY_DIFF:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->shouldBeRecursive()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 127
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "(FOLLOW("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/FollowFilter;->path:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lorg/eclipse/jgit/revwalk/FollowFilter;->ANY_DIFF:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
