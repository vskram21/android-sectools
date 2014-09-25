.class Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;
.super Ljava/lang/Object;
.source "ObjectWalk.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/revwalk/ObjectWalk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TreeVisit"
.end annotation


# instance fields
.field buf:[B

.field nameEnd:I

.field namePtr:I

.field obj:Lorg/eclipse/jgit/revwalk/RevObject;

.field parent:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

.field pathLen:I

.field ptr:I


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 738
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/revwalk/ObjectWalk$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 738
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;-><init>()V

    return-void
.end method
