.class Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory$UnpackedObjectId;
.super Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;
.source "CachedObjectDirectory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "UnpackedObjectId"
.end annotation


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 0
    .parameter "id"

    .prologue
    .line 260
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 261
    return-void
.end method
