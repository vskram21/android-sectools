.class public final Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$Entry;
.super Lorg/eclipse/jgit/lib/ObjectId;
.source "PackBitmapIndexRemapper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Entry"
.end annotation


# instance fields
.field private final flags:I

.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;


# direct methods
.method private constructor <init>(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;Lorg/eclipse/jgit/lib/AnyObjectId;I)V
    .locals 0
    .parameter
    .parameter "src"
    .parameter "flags"

    .prologue
    .line 202
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$Entry;->this$0:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;

    .line 203
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/lib/ObjectId;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 204
    iput p3, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$Entry;->flags:I

    .line 205
    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;Lorg/eclipse/jgit/lib/AnyObjectId;ILorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 199
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$Entry;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;Lorg/eclipse/jgit/lib/AnyObjectId;I)V

    return-void
.end method


# virtual methods
.method public getFlags()I
    .locals 1

    .prologue
    .line 209
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$Entry;->flags:I

    return v0
.end method
