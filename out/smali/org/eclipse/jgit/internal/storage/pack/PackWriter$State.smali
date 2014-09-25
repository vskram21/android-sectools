.class public Lorg/eclipse/jgit/internal/storage/pack/PackWriter$State;
.super Ljava/lang/Object;
.source "PackWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/pack/PackWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "State"
.end annotation


# instance fields
.field private final bytesUsed:J

.field private final phase:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;J)V
    .locals 0
    .parameter
    .parameter "phase"
    .parameter "bytesUsed"

    .prologue
    .line 2451
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$State;->this$0:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2452
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$State;->phase:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    .line 2453
    iput-wide p3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$State;->bytesUsed:J

    .line 2454
    return-void
.end method


# virtual methods
.method public estimateBytesUsed()J
    .locals 2

    .prologue
    .line 2468
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$State;->bytesUsed:J

    return-wide v0
.end method

.method public getConfig()Lorg/eclipse/jgit/storage/pack/PackConfig;
    .locals 1

    .prologue
    .line 2458
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$State;->this$0:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    #getter for: Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;
    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->access$200(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;)Lorg/eclipse/jgit/storage/pack/PackConfig;

    move-result-object v0

    return-object v0
.end method

.method public getPhase()Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;
    .locals 1

    .prologue
    .line 2463
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$State;->phase:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 2474
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "PackWriter.State["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$State;->phase:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", memory="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$State;->bytesUsed:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
