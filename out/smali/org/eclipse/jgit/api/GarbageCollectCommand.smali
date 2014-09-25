.class public Lorg/eclipse/jgit/api/GarbageCollectCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "GarbageCollectCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Ljava/util/Properties;",
        ">;"
    }
.end annotation


# instance fields
.field private expire:Ljava/util/Date;

.field private monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 5
    .parameter "repo"

    .prologue
    .line 81
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 82
    instance-of v0, p1, Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    if-nez v0, :cond_0

    .line 83
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->unsupportedGC:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 85
    :cond_0
    return-void
.end method

.method private static toProperties(Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;)Ljava/util/Properties;
    .locals 4
    .parameter "stats"

    .prologue
    .line 152
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    .line 153
    .local v0, p:Ljava/util/Properties;
    const-string v1, "numberOfLooseObjects"

    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->numberOfLooseObjects:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    const-string v1, "numberOfLooseRefs"

    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->numberOfLooseRefs:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    const-string v1, "numberOfPackedObjects"

    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->numberOfPackedObjects:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    const-string v1, "numberOfPackedRefs"

    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->numberOfPackedRefs:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    const-string v1, "numberOfPackFiles"

    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->numberOfPackFiles:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    const-string v1, "sizeOfLooseObjects"

    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->sizeOfLooseObjects:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    const-string v1, "sizeOfPackedObjects"

    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->sizeOfPackedObjects:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    return-object v0
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
    .line 71
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/GarbageCollectCommand;->call()Ljava/util/Properties;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/util/Properties;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 115
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/GarbageCollectCommand;->checkCallable()V

    .line 117
    new-instance v1, Lorg/eclipse/jgit/internal/storage/file/GC;

    iget-object v2, p0, Lorg/eclipse/jgit/api/GarbageCollectCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    check-cast v2, Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/internal/storage/file/GC;-><init>(Lorg/eclipse/jgit/internal/storage/file/FileRepository;)V

    .line 118
    .local v1, gc:Lorg/eclipse/jgit/internal/storage/file/GC;
    iget-object v2, p0, Lorg/eclipse/jgit/api/GarbageCollectCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/internal/storage/file/GC;->setProgressMonitor(Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/internal/storage/file/GC;

    .line 119
    iget-object v2, p0, Lorg/eclipse/jgit/api/GarbageCollectCommand;->expire:Ljava/util/Date;

    if-eqz v2, :cond_0

    .line 120
    iget-object v2, p0, Lorg/eclipse/jgit/api/GarbageCollectCommand;->expire:Ljava/util/Date;

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/internal/storage/file/GC;->setExpire(Ljava/util/Date;)V

    .line 123
    :cond_0
    :try_start_0
    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/GC;->gc()Ljava/util/Collection;

    .line 124
    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/GC;->getStatistics()Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;

    move-result-object v2

    invoke-static {v2}, Lorg/eclipse/jgit/api/GarbageCollectCommand;->toProperties(Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;)Ljava/util/Properties;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v2

    return-object v2

    .line 125
    :catch_0
    move-exception v0

    .line 126
    .local v0, e:Ljava/io/IOException;
    new-instance v2, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->gcFailed:Ljava/lang/String;

    invoke-direct {v2, v3, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 127
    .end local v0           #e:Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 128
    .local v0, e:Ljava/text/ParseException;
    new-instance v2, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->gcFailed:Ljava/lang/String;

    invoke-direct {v2, v3, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public getStatistics()Ljava/util/Properties;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 142
    :try_start_0
    new-instance v1, Lorg/eclipse/jgit/internal/storage/file/GC;

    iget-object v2, p0, Lorg/eclipse/jgit/api/GarbageCollectCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    check-cast v2, Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/internal/storage/file/GC;-><init>(Lorg/eclipse/jgit/internal/storage/file/FileRepository;)V

    .line 143
    .local v1, gc:Lorg/eclipse/jgit/internal/storage/file/GC;
    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/GC;->getStatistics()Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;

    move-result-object v2

    invoke-static {v2}, Lorg/eclipse/jgit/api/GarbageCollectCommand;->toProperties(Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;)Ljava/util/Properties;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    return-object v2

    .line 144
    .end local v1           #gc:Lorg/eclipse/jgit/internal/storage/file/GC;
    :catch_0
    move-exception v0

    .line 145
    .local v0, e:Ljava/io/IOException;
    new-instance v2, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->couldNotGetRepoStatistics:Ljava/lang/String;

    invoke-direct {v2, v3, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public setExpire(Ljava/util/Date;)Lorg/eclipse/jgit/api/GarbageCollectCommand;
    .locals 0
    .parameter "expire"

    .prologue
    .line 109
    iput-object p1, p0, Lorg/eclipse/jgit/api/GarbageCollectCommand;->expire:Ljava/util/Date;

    .line 110
    return-object p0
.end method

.method public setProgressMonitor(Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/api/GarbageCollectCommand;
    .locals 0
    .parameter "monitor"

    .prologue
    .line 93
    iput-object p1, p0, Lorg/eclipse/jgit/api/GarbageCollectCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 94
    return-object p0
.end method
