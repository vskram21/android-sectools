.class Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Entry;
.super Ljava/lang/Object;
.source "DeltaBaseCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Entry"
.end annotation


# instance fields
.field final data:[B

.field final type:I


# direct methods
.method constructor <init>([BI)V
    .locals 0
    .parameter "aData"
    .parameter "aType"

    .prologue
    .line 167
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 168
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Entry;->data:[B

    .line 169
    iput p2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Entry;->type:I

    .line 170
    return-void
.end method
