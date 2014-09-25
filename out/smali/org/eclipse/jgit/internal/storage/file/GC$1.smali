.class Lorg/eclipse/jgit/internal/storage/file/GC$1;
.super Ljava/lang/Object;
.source "GC.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/file/GC;->writePack(Ljava/util/Set;Ljava/util/Set;Ljava/util/Set;Ljava/util/List;)Lorg/eclipse/jgit/internal/storage/file/PackFile;
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
        "Lorg/eclipse/jgit/internal/storage/pack/PackExt;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/file/GC;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/GC;)V
    .locals 0
    .parameter

    .prologue
    .line 674
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/GC$1;->this$0:Lorg/eclipse/jgit/internal/storage/file/GC;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 674
    check-cast p1, Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    .end local p1
    check-cast p2, Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/GC$1;->compare(Lorg/eclipse/jgit/internal/storage/pack/PackExt;Lorg/eclipse/jgit/internal/storage/pack/PackExt;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/eclipse/jgit/internal/storage/pack/PackExt;Lorg/eclipse/jgit/internal/storage/pack/PackExt;)I
    .locals 2
    .parameter "o1"
    .parameter "o2"

    .prologue
    .line 679
    if-ne p1, p2, :cond_0

    .line 680
    const/4 v0, 0x0

    .line 685
    :goto_0
    return v0

    .line 681
    :cond_0
    sget-object v0, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    if-ne p1, v0, :cond_1

    .line 682
    const/4 v0, 0x1

    goto :goto_0

    .line 683
    :cond_1
    sget-object v0, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    if-ne p2, v0, :cond_2

    .line 684
    const/4 v0, -0x1

    goto :goto_0

    .line 685
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->signum(I)I

    move-result v0

    goto :goto_0
.end method
