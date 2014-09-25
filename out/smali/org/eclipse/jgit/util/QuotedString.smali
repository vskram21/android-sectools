.class public abstract Lorg/eclipse/jgit/util/QuotedString;
.super Ljava/lang/Object;
.source "QuotedString.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/util/QuotedString$1;,
        Lorg/eclipse/jgit/util/QuotedString$BourneStyle;,
        Lorg/eclipse/jgit/util/QuotedString$BourneUserPathStyle;,
        Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;
    }
.end annotation


# static fields
.field public static final BOURNE:Lorg/eclipse/jgit/util/QuotedString$BourneStyle;

.field public static final BOURNE_USER_PATH:Lorg/eclipse/jgit/util/QuotedString$BourneUserPathStyle;

.field public static final GIT_PATH:Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 53
    new-instance v0, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;-><init>(Lorg/eclipse/jgit/util/QuotedString$1;)V

    sput-object v0, Lorg/eclipse/jgit/util/QuotedString;->GIT_PATH:Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;

    .line 62
    new-instance v0, Lorg/eclipse/jgit/util/QuotedString$BourneStyle;

    invoke-direct {v0}, Lorg/eclipse/jgit/util/QuotedString$BourneStyle;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/util/QuotedString;->BOURNE:Lorg/eclipse/jgit/util/QuotedString$BourneStyle;

    .line 65
    new-instance v0, Lorg/eclipse/jgit/util/QuotedString$BourneUserPathStyle;

    invoke-direct {v0}, Lorg/eclipse/jgit/util/QuotedString$BourneUserPathStyle;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/util/QuotedString;->BOURNE_USER_PATH:Lorg/eclipse/jgit/util/QuotedString$BourneUserPathStyle;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 212
    return-void
.end method


# virtual methods
.method public dequote(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "in"

    .prologue
    .line 101
    invoke-static {p1}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v0

    .line 102
    .local v0, b:[B
    const/4 v1, 0x0

    array-length v2, v0

    invoke-virtual {p0, v0, v1, v2}, Lorg/eclipse/jgit/util/QuotedString;->dequote([BII)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public abstract dequote([BII)Ljava/lang/String;
.end method

.method public abstract quote(Ljava/lang/String;)Ljava/lang/String;
.end method
