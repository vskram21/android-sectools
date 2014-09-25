.class public Lorg/eclipse/jgit/api/StatusCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "StatusCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Lorg/eclipse/jgit/api/Status;",
        ">;"
    }
.end annotation


# instance fields
.field private paths:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private progressMonitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

.field private workingTreeIt:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    const/4 v0, 0x0

    .line 79
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 72
    iput-object v0, p0, Lorg/eclipse/jgit/api/StatusCommand;->paths:Ljava/util/List;

    .line 73
    iput-object v0, p0, Lorg/eclipse/jgit/api/StatusCommand;->progressMonitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 80
    return-void
.end method


# virtual methods
.method public addPath(Ljava/lang/String;)Lorg/eclipse/jgit/api/StatusCommand;
    .locals 1
    .parameter "path"

    .prologue
    .line 98
    iget-object v0, p0, Lorg/eclipse/jgit/api/StatusCommand;->paths:Ljava/util/List;

    if-nez v0, :cond_0

    .line 99
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/api/StatusCommand;->paths:Ljava/util/List;

    .line 100
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/api/StatusCommand;->paths:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    return-object p0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 70
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/StatusCommand;->call()Lorg/eclipse/jgit/api/Status;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/eclipse/jgit/api/Status;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Lorg/eclipse/jgit/errors/NoWorkTreeException;
        }
    .end annotation

    .prologue
    .line 125
    iget-object v2, p0, Lorg/eclipse/jgit/api/StatusCommand;->workingTreeIt:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    if-nez v2, :cond_0

    .line 126
    new-instance v2, Lorg/eclipse/jgit/treewalk/FileTreeIterator;

    iget-object v3, p0, Lorg/eclipse/jgit/api/StatusCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    iput-object v2, p0, Lorg/eclipse/jgit/api/StatusCommand;->workingTreeIt:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    .line 129
    :cond_0
    :try_start_0
    new-instance v0, Lorg/eclipse/jgit/lib/IndexDiff;

    iget-object v2, p0, Lorg/eclipse/jgit/api/StatusCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v3, "HEAD"

    iget-object v4, p0, Lorg/eclipse/jgit/api/StatusCommand;->workingTreeIt:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    invoke-direct {v0, v2, v3, v4}, Lorg/eclipse/jgit/lib/IndexDiff;-><init>(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)V

    .line 130
    .local v0, diff:Lorg/eclipse/jgit/lib/IndexDiff;
    iget-object v2, p0, Lorg/eclipse/jgit/api/StatusCommand;->paths:Ljava/util/List;

    if-eqz v2, :cond_1

    .line 131
    iget-object v2, p0, Lorg/eclipse/jgit/api/StatusCommand;->paths:Ljava/util/List;

    invoke-static {v2}, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup;->createFromStrings(Ljava/util/Collection;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/eclipse/jgit/lib/IndexDiff;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    .line 132
    :cond_1
    iget-object v2, p0, Lorg/eclipse/jgit/api/StatusCommand;->progressMonitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    if-nez v2, :cond_2

    .line 133
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/IndexDiff;->diff()Z

    .line 137
    :goto_0
    new-instance v2, Lorg/eclipse/jgit/api/Status;

    invoke-direct {v2, v0}, Lorg/eclipse/jgit/api/Status;-><init>(Lorg/eclipse/jgit/lib/IndexDiff;)V

    return-object v2

    .line 135
    :cond_2
    iget-object v2, p0, Lorg/eclipse/jgit/api/StatusCommand;->progressMonitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, ""

    invoke-virtual {v0, v2, v3, v4, v5}, Lorg/eclipse/jgit/lib/IndexDiff;->diff(Lorg/eclipse/jgit/lib/ProgressMonitor;IILjava/lang/String;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 138
    .end local v0           #diff:Lorg/eclipse/jgit/lib/IndexDiff;
    :catch_0
    move-exception v1

    .line 139
    .local v1, e:Ljava/io/IOException;
    new-instance v2, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public getPaths()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 112
    iget-object v0, p0, Lorg/eclipse/jgit/api/StatusCommand;->paths:Ljava/util/List;

    return-object v0
.end method

.method public setProgressMonitor(Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/api/StatusCommand;
    .locals 0
    .parameter "progressMonitor"

    .prologue
    .line 165
    iput-object p1, p0, Lorg/eclipse/jgit/api/StatusCommand;->progressMonitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 166
    return-object p0
.end method

.method public setWorkingTreeIt(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)Lorg/eclipse/jgit/api/StatusCommand;
    .locals 0
    .parameter "workingTreeIt"

    .prologue
    .line 152
    iput-object p1, p0, Lorg/eclipse/jgit/api/StatusCommand;->workingTreeIt:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    .line 153
    return-object p0
.end method
