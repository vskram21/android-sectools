.class Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2$1;
.super Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;
.source "PackIndexV2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->initEntry()Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;)V
    .locals 0
    .parameter

    .prologue
    .line 309
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2$1;->this$1:Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;

    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;-><init>()V

    return-void
.end method


# virtual methods
.method protected ensureId()V
    .locals 3

    .prologue
    .line 311
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2$1;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2$1;->this$1:Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;

    iget-object v1, v1, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->this$0:Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->names:[[I
    invoke-static {v1}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->access$100(Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;)[[I

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2$1;->this$1:Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->levelOne:I
    invoke-static {v2}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->access$200(Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;)I

    move-result v2

    aget-object v1, v1, v2

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2$1;->this$1:Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->levelTwo:I
    invoke-static {v2}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->access$300(Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;)I

    move-result v2

    add-int/lit8 v2, v2, -0x5

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromRaw([II)V

    .line 313
    return-void
.end method
