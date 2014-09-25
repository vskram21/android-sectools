.class Lorg/eclipse/jgit/lib/Config$StringReader;
.super Ljava/lang/Object;
.source "Config.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/Config;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StringReader"
.end annotation


# instance fields
.field private final buf:[C

.field private pos:I


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "in"

    .prologue
    .line 1304
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1305
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/Config$StringReader;->buf:[C

    .line 1306
    return-void
.end method


# virtual methods
.method read()I
    .locals 4

    .prologue
    .line 1310
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/lib/Config$StringReader;->buf:[C

    iget v2, p0, Lorg/eclipse/jgit/lib/Config$StringReader;->pos:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/eclipse/jgit/lib/Config$StringReader;->pos:I

    aget-char v1, v1, v2
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1313
    :goto_0
    return v1

    .line 1311
    :catch_0
    move-exception v0

    .line 1312
    .local v0, e:Ljava/lang/ArrayIndexOutOfBoundsException;
    iget-object v1, p0, Lorg/eclipse/jgit/lib/Config$StringReader;->buf:[C

    array-length v1, v1

    iput v1, p0, Lorg/eclipse/jgit/lib/Config$StringReader;->pos:I

    .line 1313
    const/4 v1, -0x1

    goto :goto_0
.end method

.method reset()V
    .locals 1

    .prologue
    .line 1318
    iget v0, p0, Lorg/eclipse/jgit/lib/Config$StringReader;->pos:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/lib/Config$StringReader;->pos:I

    .line 1319
    return-void
.end method
