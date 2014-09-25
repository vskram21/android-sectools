.class final Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;
.super Ljava/lang/Object;
.source "DeltaTask.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "WeightedPath"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;",
        ">;"
    }
.end annotation


# instance fields
.field final slice:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;

.field final weight:J


# direct methods
.method constructor <init>(JLorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;)V
    .locals 0
    .parameter "weight"
    .parameter "s"

    .prologue
    .line 225
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 226
    iput-wide p1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;->weight:J

    .line 227
    iput-object p3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;->slice:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;

    .line 228
    return-void
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 221
    check-cast p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;

    .end local p1
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;->compareTo(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;)I
    .locals 5
    .parameter "o"

    .prologue
    .line 231
    iget-wide v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;->weight:J

    iget-wide v3, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;->weight:J

    sub-long/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Long;->signum(J)I

    move-result v0

    .line 232
    .local v0, cmp:I
    if-eqz v0, :cond_0

    .line 234
    .end local v0           #cmp:I
    :goto_0
    return v0

    .restart local v0       #cmp:I
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;->slice:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;

    iget v1, v1, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;->beginIndex:I

    iget-object v2, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;->slice:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;

    iget v2, v2, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;->beginIndex:I

    sub-int v0, v1, v2

    goto :goto_0
.end method
