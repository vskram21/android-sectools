.class final Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;
.super Lorg/eclipse/jgit/lib/BitmapObject;
.source "BitmapIndexImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "BitmapObjectImpl"
.end annotation


# instance fields
.field private objectId:Lorg/eclipse/jgit/lib/ObjectId;

.field private type:I


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 443
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/BitmapObject;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 443
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;-><init>()V

    return-void
.end method

.method static synthetic access$1402(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 443
    iput p1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;->type:I

    return p1
.end method

.method static synthetic access$1502(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 443
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;->objectId:Lorg/eclipse/jgit/lib/ObjectId;

    return-object p1
.end method


# virtual methods
.method public getObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 450
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;->objectId:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 455
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;->type:I

    return v0
.end method
