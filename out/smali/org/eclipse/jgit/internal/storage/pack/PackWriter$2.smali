.class Lorg/eclipse/jgit/internal/storage/pack/PackWriter$2;
.super Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;
.source "PackWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->getObjectSet()Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 0
    .parameter
    .parameter "x0"

    .prologue
    .line 594
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$2;->this$0:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    invoke-direct {p0, p2}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    return-void
.end method
