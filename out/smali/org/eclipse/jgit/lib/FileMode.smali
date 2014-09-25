.class public abstract Lorg/eclipse/jgit/lib/FileMode;
.super Ljava/lang/Object;
.source "FileMode.java"


# static fields
.field public static final EXECUTABLE_FILE:Lorg/eclipse/jgit/lib/FileMode; = null

.field public static final GITLINK:Lorg/eclipse/jgit/lib/FileMode; = null

.field public static final MISSING:Lorg/eclipse/jgit/lib/FileMode; = null

.field public static final REGULAR_FILE:Lorg/eclipse/jgit/lib/FileMode; = null

.field public static final SYMLINK:Lorg/eclipse/jgit/lib/FileMode; = null

.field public static final TREE:Lorg/eclipse/jgit/lib/FileMode; = null

.field public static final TYPE_FILE:I = 0x8000

.field public static final TYPE_GITLINK:I = 0xe000

.field public static final TYPE_MASK:I = 0xf000

.field public static final TYPE_MISSING:I = 0x0

.field public static final TYPE_SYMLINK:I = 0xa000

.field public static final TYPE_TREE:I = 0x4000


# instance fields
.field private final modeBits:I

.field private final objectType:I

.field private final octalBytes:[B


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x3

    .line 87
    new-instance v0, Lorg/eclipse/jgit/lib/FileMode$1;

    const/16 v1, 0x4000

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/FileMode$1;-><init>(II)V

    sput-object v0, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    .line 96
    new-instance v0, Lorg/eclipse/jgit/lib/FileMode$2;

    const v1, 0xa000

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/lib/FileMode$2;-><init>(II)V

    sput-object v0, Lorg/eclipse/jgit/lib/FileMode;->SYMLINK:Lorg/eclipse/jgit/lib/FileMode;

    .line 105
    new-instance v0, Lorg/eclipse/jgit/lib/FileMode$3;

    const v1, 0x81a4

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/lib/FileMode$3;-><init>(II)V

    sput-object v0, Lorg/eclipse/jgit/lib/FileMode;->REGULAR_FILE:Lorg/eclipse/jgit/lib/FileMode;

    .line 114
    new-instance v0, Lorg/eclipse/jgit/lib/FileMode$4;

    const v1, 0x81ed

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/lib/FileMode$4;-><init>(II)V

    sput-object v0, Lorg/eclipse/jgit/lib/FileMode;->EXECUTABLE_FILE:Lorg/eclipse/jgit/lib/FileMode;

    .line 123
    new-instance v0, Lorg/eclipse/jgit/lib/FileMode$5;

    const v1, 0xe000

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/FileMode$5;-><init>(II)V

    sput-object v0, Lorg/eclipse/jgit/lib/FileMode;->GITLINK:Lorg/eclipse/jgit/lib/FileMode;

    .line 132
    new-instance v0, Lorg/eclipse/jgit/lib/FileMode$6;

    const/4 v1, 0x0

    const/4 v2, -0x1

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/FileMode$6;-><init>(II)V

    sput-object v0, Lorg/eclipse/jgit/lib/FileMode;->MISSING:Lorg/eclipse/jgit/lib/FileMode;

    return-void
.end method

.method private constructor <init>(II)V
    .locals 6
    .parameter "mode"
    .parameter "expType"

    .prologue
    .line 178
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 179
    iput p1, p0, Lorg/eclipse/jgit/lib/FileMode;->modeBits:I

    .line 180
    iput p2, p0, Lorg/eclipse/jgit/lib/FileMode;->objectType:I

    .line 181
    if-eqz p1, :cond_1

    .line 182
    const/16 v3, 0xa

    new-array v2, v3, [B

    .line 183
    .local v2, tmp:[B
    array-length v1, v2

    .line 185
    .local v1, p:I
    :goto_0
    if-eqz p1, :cond_0

    .line 186
    add-int/lit8 v1, v1, -0x1

    and-int/lit8 v3, p1, 0x7

    add-int/lit8 v3, v3, 0x30

    int-to-byte v3, v3

    aput-byte v3, v2, v1

    .line 187
    shr-int/lit8 p1, p1, 0x3

    goto :goto_0

    .line 190
    :cond_0
    array-length v3, v2

    sub-int/2addr v3, v1

    new-array v3, v3, [B

    iput-object v3, p0, Lorg/eclipse/jgit/lib/FileMode;->octalBytes:[B

    .line 191
    const/4 v0, 0x0

    .local v0, k:I
    :goto_1
    iget-object v3, p0, Lorg/eclipse/jgit/lib/FileMode;->octalBytes:[B

    array-length v3, v3

    if-ge v0, v3, :cond_2

    .line 192
    iget-object v3, p0, Lorg/eclipse/jgit/lib/FileMode;->octalBytes:[B

    add-int v4, v1, v0

    aget-byte v4, v2, v4

    aput-byte v4, v3, v0

    .line 191
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 195
    .end local v0           #k:I
    .end local v1           #p:I
    .end local v2           #tmp:[B
    :cond_1
    const/4 v3, 0x1

    new-array v3, v3, [B

    const/4 v4, 0x0

    const/16 v5, 0x30

    aput-byte v5, v3, v4

    iput-object v3, p0, Lorg/eclipse/jgit/lib/FileMode;->octalBytes:[B

    .line 197
    :cond_2
    return-void
.end method

.method synthetic constructor <init>(IILorg/eclipse/jgit/lib/FileMode$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 58
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/lib/FileMode;-><init>(II)V

    return-void
.end method

.method public static final fromBits(I)Lorg/eclipse/jgit/lib/FileMode;
    .locals 2
    .parameter "bits"

    .prologue
    .line 147
    const v0, 0xf000

    and-int/2addr v0, p0

    sparse-switch v0, :sswitch_data_0

    .line 164
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/lib/FileMode$7;

    const/4 v1, -0x1

    invoke-direct {v0, p0, v1, p0}, Lorg/eclipse/jgit/lib/FileMode$7;-><init>(III)V

    :goto_0
    return-object v0

    .line 149
    :sswitch_0
    if-nez p0, :cond_0

    .line 150
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->MISSING:Lorg/eclipse/jgit/lib/FileMode;

    goto :goto_0

    .line 153
    :sswitch_1
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    goto :goto_0

    .line 155
    :sswitch_2
    and-int/lit8 v0, p0, 0x49

    if-eqz v0, :cond_1

    .line 156
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->EXECUTABLE_FILE:Lorg/eclipse/jgit/lib/FileMode;

    goto :goto_0

    .line 157
    :cond_1
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->REGULAR_FILE:Lorg/eclipse/jgit/lib/FileMode;

    goto :goto_0

    .line 159
    :sswitch_3
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->SYMLINK:Lorg/eclipse/jgit/lib/FileMode;

    goto :goto_0

    .line 161
    :sswitch_4
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->GITLINK:Lorg/eclipse/jgit/lib/FileMode;

    goto :goto_0

    .line 147
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x4000 -> :sswitch_1
        0x8000 -> :sswitch_2
        0xa000 -> :sswitch_3
        0xe000 -> :sswitch_4
    .end sparse-switch
.end method


# virtual methods
.method public copyTo(Ljava/io/OutputStream;)V
    .locals 1
    .parameter "os"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 222
    iget-object v0, p0, Lorg/eclipse/jgit/lib/FileMode;->octalBytes:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 223
    return-void
.end method

.method public copyTo([BI)V
    .locals 3
    .parameter "buf"
    .parameter "ptr"

    .prologue
    .line 239
    iget-object v0, p0, Lorg/eclipse/jgit/lib/FileMode;->octalBytes:[B

    const/4 v1, 0x0

    iget-object v2, p0, Lorg/eclipse/jgit/lib/FileMode;->octalBytes:[B

    array-length v2, v2

    invoke-static {v0, v1, p1, p2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 240
    return-void
.end method

.method public copyToLength()I
    .locals 1

    .prologue
    .line 246
    iget-object v0, p0, Lorg/eclipse/jgit/lib/FileMode;->octalBytes:[B

    array-length v0, v0

    return v0
.end method

.method public abstract equals(I)Z
.end method

.method public getBits()I
    .locals 1

    .prologue
    .line 269
    iget v0, p0, Lorg/eclipse/jgit/lib/FileMode;->modeBits:I

    return v0
.end method

.method public getObjectType()I
    .locals 1

    .prologue
    .line 257
    iget v0, p0, Lorg/eclipse/jgit/lib/FileMode;->objectType:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 262
    iget v0, p0, Lorg/eclipse/jgit/lib/FileMode;->modeBits:I

    invoke-static {v0}, Ljava/lang/Integer;->toOctalString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
