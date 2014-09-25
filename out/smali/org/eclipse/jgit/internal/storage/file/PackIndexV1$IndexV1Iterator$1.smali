.class Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator$1;
.super Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;
.source "PackIndexV1.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->initEntry()Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;)V
    .locals 0
    .parameter

    .prologue
    .line 237
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator$1;->this$1:Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;

    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;-><init>()V

    return-void
.end method


# virtual methods
.method protected ensureId()V
    .locals 3

    .prologue
    .line 239
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator$1;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator$1;->this$1:Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;

    iget-object v1, v1, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->this$0:Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxdata:[[B
    invoke-static {v1}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->access$100(Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;)[[B

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator$1;->this$1:Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->levelOne:I
    invoke-static {v2}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->access$200(Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;)I

    move-result v2

    aget-object v1, v1, v2

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator$1;->this$1:Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->levelTwo:I
    invoke-static {v2}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->access$300(Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;)I

    move-result v2

    add-int/lit8 v2, v2, -0x14

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromRaw([BI)V

    .line 241
    return-void
.end method
