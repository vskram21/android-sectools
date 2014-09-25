.class Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$1;
.super Ljava/lang/Object;
.source "PackBitmapIndexRemapper.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$Entry;",
        ">;"
    }
.end annotation


# instance fields
.field private entry:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$Entry;

.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;

.field final synthetic val$it:Ljava/util/Iterator;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;Ljava/util/Iterator;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 145
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$1;->this$0:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;

    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$1;->val$it:Ljava/util/Iterator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 5

    .prologue
    .line 149
    :cond_0
    :goto_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$1;->entry:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$Entry;

    if-nez v1, :cond_1

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$1;->val$it:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 150
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$1;->val$it:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;

    .line 151
    .local v0, sb:Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$1;->this$0:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->newPackIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    invoke-static {v1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->access$000(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;)Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;->findPosition(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 152
    new-instance v1, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$Entry;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$1;->this$0:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;->getFlags()I

    move-result v3

    const/4 v4, 0x0

    invoke-direct {v1, v2, v0, v3, v4}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$Entry;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;Lorg/eclipse/jgit/lib/AnyObjectId;ILorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$1;)V

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$1;->entry:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$Entry;

    goto :goto_0

    .line 154
    .end local v0           #sb:Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$1;->entry:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$Entry;

    if-eqz v1, :cond_2

    const/4 v1, 0x1

    :goto_1
    return v1

    :cond_2
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 145
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$1;->next()Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$Entry;

    move-result-object v0

    return-object v0
.end method

.method public next()Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$Entry;
    .locals 2

    .prologue
    .line 158
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$1;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 159
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1

    .line 161
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$1;->entry:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$Entry;

    .line 162
    .local v0, res:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$Entry;
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$1;->entry:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$Entry;

    .line 163
    return-object v0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 167
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
