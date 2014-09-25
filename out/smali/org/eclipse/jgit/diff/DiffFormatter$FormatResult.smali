.class Lorg/eclipse/jgit/diff/DiffFormatter$FormatResult;
.super Ljava/lang/Object;
.source "DiffFormatter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/diff/DiffFormatter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FormatResult"
.end annotation


# instance fields
.field a:Lorg/eclipse/jgit/diff/RawText;

.field b:Lorg/eclipse/jgit/diff/RawText;

.field header:Lorg/eclipse/jgit/patch/FileHeader;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 892
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/diff/DiffFormatter$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 892
    invoke-direct {p0}, Lorg/eclipse/jgit/diff/DiffFormatter$FormatResult;-><init>()V

    return-void
.end method
