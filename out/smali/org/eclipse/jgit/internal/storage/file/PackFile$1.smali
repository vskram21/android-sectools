.class final Lorg/eclipse/jgit/internal/storage/file/PackFile$1;
.super Ljava/lang/Object;
.source "PackFile.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/PackFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/eclipse/jgit/internal/storage/file/PackFile;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 94
    check-cast p1, Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .end local p1
    check-cast p2, Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/PackFile$1;->compare(Lorg/eclipse/jgit/internal/storage/file/PackFile;Lorg/eclipse/jgit/internal/storage/file/PackFile;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/eclipse/jgit/internal/storage/file/PackFile;Lorg/eclipse/jgit/internal/storage/file/PackFile;)I
    .locals 2
    .parameter "a"
    .parameter "b"

    .prologue
    .line 96
    #getter for: Lorg/eclipse/jgit/internal/storage/file/PackFile;->packLastModified:I
    invoke-static {p2}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->access$000(Lorg/eclipse/jgit/internal/storage/file/PackFile;)I

    move-result v0

    #getter for: Lorg/eclipse/jgit/internal/storage/file/PackFile;->packLastModified:I
    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->access$000(Lorg/eclipse/jgit/internal/storage/file/PackFile;)I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method
