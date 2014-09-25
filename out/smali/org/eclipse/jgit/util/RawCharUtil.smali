.class public Lorg/eclipse/jgit/util/RawCharUtil;
.super Ljava/lang/Object;
.source "RawCharUtil.java"


# static fields
.field private static final WHITESPACE:[Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 52
    const/16 v0, 0x100

    new-array v0, v0, [Z

    sput-object v0, Lorg/eclipse/jgit/util/RawCharUtil;->WHITESPACE:[Z

    .line 55
    sget-object v0, Lorg/eclipse/jgit/util/RawCharUtil;->WHITESPACE:[Z

    const/16 v1, 0xd

    aput-boolean v2, v0, v1

    .line 56
    sget-object v0, Lorg/eclipse/jgit/util/RawCharUtil;->WHITESPACE:[Z

    const/16 v1, 0xa

    aput-boolean v2, v0, v1

    .line 57
    sget-object v0, Lorg/eclipse/jgit/util/RawCharUtil;->WHITESPACE:[Z

    const/16 v1, 0x9

    aput-boolean v2, v0, v1

    .line 58
    sget-object v0, Lorg/eclipse/jgit/util/RawCharUtil;->WHITESPACE:[Z

    const/16 v1, 0x20

    aput-boolean v2, v0, v1

    .line 59
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 115
    return-void
.end method

.method public static isWhitespace(B)Z
    .locals 2
    .parameter "c"

    .prologue
    .line 69
    sget-object v0, Lorg/eclipse/jgit/util/RawCharUtil;->WHITESPACE:[Z

    and-int/lit16 v1, p0, 0xff

    aget-boolean v0, v0, v1

    return v0
.end method

.method public static trimLeadingWhitespace([BII)I
    .locals 1
    .parameter "raw"
    .parameter "start"
    .parameter "end"

    .prologue
    .line 107
    :goto_0
    if-ge p1, p2, :cond_0

    aget-byte v0, p0, p1

    invoke-static {v0}, Lorg/eclipse/jgit/util/RawCharUtil;->isWhitespace(B)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 108
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 110
    :cond_0
    return p1
.end method

.method public static trimTrailingWhitespace([BII)I
    .locals 2
    .parameter "raw"
    .parameter "start"
    .parameter "end"

    .prologue
    .line 86
    add-int/lit8 v0, p2, -0x1

    .line 87
    .local v0, ptr:I
    :goto_0
    if-gt p1, v0, :cond_0

    aget-byte v1, p0, v0

    invoke-static {v1}, Lorg/eclipse/jgit/util/RawCharUtil;->isWhitespace(B)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 88
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 90
    :cond_0
    add-int/lit8 v1, v0, 0x1

    return v1
.end method
