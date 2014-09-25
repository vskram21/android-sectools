.class final Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;
.super Ljava/lang/Object;
.source "DeltaWindowEntry.java"


# instance fields
.field buffer:[B

.field index:Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;

.field next:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

.field object:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

.field prev:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static createWindow(I)Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;
    .locals 4
    .parameter "cnt"

    .prologue
    .line 106
    new-instance v3, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    invoke-direct {v3}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;-><init>()V

    .line 107
    .local v3, res:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;
    move-object v2, v3

    .line 108
    .local v2, p:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, p0, :cond_0

    .line 109
    new-instance v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    invoke-direct {v0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;-><init>()V

    .line 110
    .local v0, e:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;
    iput-object v2, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->prev:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    .line 111
    iput-object v0, v2, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->next:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    .line 112
    move-object v2, v0

    .line 108
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 114
    .end local v0           #e:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;
    :cond_0
    iput-object v3, v2, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->next:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    .line 115
    iput-object v2, v3, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->prev:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    .line 116
    return-object v3
.end method


# virtual methods
.method final depth()I
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->object:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getDeltaDepth()I

    move-result v0

    return v0
.end method

.method final empty()Z
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->object:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method final makeNext(Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;)V
    .locals 2
    .parameter "e"

    .prologue
    .line 85
    iget-object v0, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->prev:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    iget-object v1, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->next:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    iput-object v1, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->next:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    .line 86
    iget-object v0, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->next:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    iget-object v1, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->prev:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    iput-object v1, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->prev:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    .line 89
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->next:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    iput-object v0, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->next:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    .line 90
    iput-object p0, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->prev:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    .line 91
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->next:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    iput-object p1, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->prev:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    .line 92
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->next:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    .line 93
    return-void
.end method

.method final set(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V
    .locals 1
    .parameter "object"

    .prologue
    const/4 v0, 0x0

    .line 58
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->object:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 59
    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->index:Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;

    .line 60
    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->buffer:[B

    .line 61
    return-void
.end method

.method final size()I
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->object:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getWeight()I

    move-result v0

    return v0
.end method

.method final type()I
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->object:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getType()I

    move-result v0

    return v0
.end method
