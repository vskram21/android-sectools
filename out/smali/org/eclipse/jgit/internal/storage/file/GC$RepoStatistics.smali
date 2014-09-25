.class public Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;
.super Ljava/lang/Object;
.source "GC.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/GC;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "RepoStatistics"
.end annotation


# instance fields
.field public numberOfLooseObjects:J

.field public numberOfLooseRefs:J

.field public numberOfPackFiles:J

.field public numberOfPackedObjects:J

.field public numberOfPackedRefs:J

.field public sizeOfLooseObjects:J

.field public sizeOfPackedObjects:J

.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/file/GC;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/internal/storage/file/GC;)V
    .locals 0
    .parameter

    .prologue
    .line 829
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->this$0:Lorg/eclipse/jgit/internal/storage/file/GC;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 868
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 869
    .local v0, b:Ljava/lang/StringBuilder;
    const-string v1, "numberOfPackedObjects="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->numberOfPackedObjects:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 870
    const-string v1, ", numberOfPackFiles="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->numberOfPackFiles:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 871
    const-string v1, ", numberOfLooseObjects="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->numberOfLooseObjects:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 872
    const-string v1, ", numberOfLooseRefs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->numberOfLooseRefs:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 873
    const-string v1, ", numberOfPackedRefs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->numberOfPackedRefs:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 874
    const-string v1, ", sizeOfLooseObjects="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->sizeOfLooseObjects:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 875
    const-string v1, ", sizeOfPackedObjects="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->sizeOfPackedObjects:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 876
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
