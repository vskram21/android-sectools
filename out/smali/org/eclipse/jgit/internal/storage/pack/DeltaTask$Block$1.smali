.class Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block$1;
.super Ljava/lang/Object;
.source "DeltaTask.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->computeTopPaths()Ljava/util/ArrayList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;)V
    .locals 0
    .parameter

    .prologue
    .line 208
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block$1;->this$0:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 208
    check-cast p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;

    .end local p1
    check-cast p2, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block$1;->compare(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;)I
    .locals 2
    .parameter "a"
    .parameter "b"

    .prologue
    .line 210
    iget-object v0, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;->slice:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;

    iget v0, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;->beginIndex:I

    iget-object v1, p2, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;->slice:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;

    iget v1, v1, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;->beginIndex:I

    sub-int/2addr v0, v1

    return v0
.end method
