.class final Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;
.super Ljava/lang/Object;
.source "BitmapIndexImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ComboBitset"
.end annotation


# instance fields
.field private inflatingBitmap:Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;

.field private toAdd:Lorg/eclipse/jgit/internal/storage/file/BitSet;

.field private toRemove:Lorg/eclipse/jgit/internal/storage/file/BitSet;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 126
    new-instance v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>()V

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    .line 127
    return-void
.end method

.method private constructor <init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V
    .locals 1
    .parameter "bitmap"

    .prologue
    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->inflatingBitmap:Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;

    .line 131
    return-void
.end method

.method synthetic constructor <init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 118
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 118
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;-><init>()V

    return-void
.end method


# virtual methods
.method andNot(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V
    .locals 1
    .parameter "inbits"

    .prologue
    .line 160
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->toAdd:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->toRemove:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    if-eqz v0, :cond_1

    .line 161
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->combine()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 162
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->inflatingBitmap:Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->andNot(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->inflatingBitmap:Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;

    .line 163
    return-void
.end method

.method combine()Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 134
    const/4 v0, 0x0

    .line 135
    .local v0, toAddCompressed:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->toAdd:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    if-eqz v2, :cond_0

    .line 136
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->toAdd:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/BitSet;->toEWAHCompressedBitmap()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    .line 137
    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->toAdd:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    .line 140
    :cond_0
    const/4 v1, 0x0

    .line 141
    .local v1, toRemoveCompressed:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->toRemove:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    if-eqz v2, :cond_1

    .line 142
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->toRemove:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/BitSet;->toEWAHCompressedBitmap()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v1

    .line 143
    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->toRemove:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    .line 146
    :cond_1
    if-eqz v0, :cond_2

    .line 147
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->or(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    .line 148
    :cond_2
    if-eqz v1, :cond_3

    .line 149
    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->andNot(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    .line 150
    :cond_3
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->inflatingBitmap:Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->getBitmap()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v2

    return-object v2
.end method

.method contains(I)Z
    .locals 1
    .parameter "position"

    .prologue
    .line 172
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->toRemove:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->toRemove:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/BitSet;->get(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 173
    const/4 v0, 0x0

    .line 176
    :goto_0
    return v0

    .line 174
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->toAdd:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->toAdd:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/BitSet;->get(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 175
    const/4 v0, 0x1

    goto :goto_0

    .line 176
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->inflatingBitmap:Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->contains(I)Z

    move-result v0

    goto :goto_0
.end method

.method or(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V
    .locals 1
    .parameter "inbits"

    .prologue
    .line 154
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->toRemove:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    if-eqz v0, :cond_0

    .line 155
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->combine()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 156
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->inflatingBitmap:Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->or(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->inflatingBitmap:Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;

    .line 157
    return-void
.end method

.method remove(I)V
    .locals 2
    .parameter "position"

    .prologue
    .line 180
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->toAdd:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    if-eqz v0, :cond_0

    .line 181
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->toAdd:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/BitSet;->clear(I)V

    .line 183
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->inflatingBitmap:Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->maybeContains(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 184
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->toRemove:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    if-nez v0, :cond_1

    .line 185
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/BitSet;

    add-int/lit16 v1, p1, 0x2800

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/BitSet;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->toRemove:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    .line 186
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->toRemove:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/BitSet;->set(I)V

    .line 188
    :cond_2
    return-void
.end method

.method set(I)V
    .locals 2
    .parameter "position"

    .prologue
    .line 191
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->toRemove:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    if-eqz v0, :cond_0

    .line 192
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->toRemove:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/BitSet;->clear(I)V

    .line 194
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->toAdd:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    if-nez v0, :cond_1

    .line 195
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/BitSet;

    add-int/lit16 v1, p1, 0x2800

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/BitSet;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->toAdd:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    .line 196
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->toAdd:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/BitSet;->set(I)V

    .line 197
    return-void
.end method

.method xor(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V
    .locals 1
    .parameter "inbits"

    .prologue
    .line 166
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->toAdd:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->toRemove:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    if-eqz v0, :cond_1

    .line 167
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->combine()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 168
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->inflatingBitmap:Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->xor(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->inflatingBitmap:Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;

    .line 169
    return-void
.end method
