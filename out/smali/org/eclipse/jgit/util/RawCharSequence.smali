.class public final Lorg/eclipse/jgit/util/RawCharSequence;
.super Ljava/lang/Object;
.source "RawCharSequence.java"

# interfaces
.implements Ljava/lang/CharSequence;


# static fields
.field public static final EMPTY:Lorg/eclipse/jgit/util/RawCharSequence;


# instance fields
.field final buffer:[B

.field final endPtr:I

.field final startPtr:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 53
    new-instance v0, Lorg/eclipse/jgit/util/RawCharSequence;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v2, v2}, Lorg/eclipse/jgit/util/RawCharSequence;-><init>([BII)V

    sput-object v0, Lorg/eclipse/jgit/util/RawCharSequence;->EMPTY:Lorg/eclipse/jgit/util/RawCharSequence;

    return-void
.end method

.method public constructor <init>([BII)V
    .locals 0
    .parameter "buf"
    .parameter "start"
    .parameter "end"

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    iput-object p1, p0, Lorg/eclipse/jgit/util/RawCharSequence;->buffer:[B

    .line 73
    iput p2, p0, Lorg/eclipse/jgit/util/RawCharSequence;->startPtr:I

    .line 74
    iput p3, p0, Lorg/eclipse/jgit/util/RawCharSequence;->endPtr:I

    .line 75
    return-void
.end method


# virtual methods
.method public charAt(I)C
    .locals 2
    .parameter "index"

    .prologue
    .line 78
    iget-object v0, p0, Lorg/eclipse/jgit/util/RawCharSequence;->buffer:[B

    iget v1, p0, Lorg/eclipse/jgit/util/RawCharSequence;->startPtr:I

    add-int/2addr v1, p1

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    int-to-char v0, v0

    return v0
.end method

.method public length()I
    .locals 2

    .prologue
    .line 82
    iget v0, p0, Lorg/eclipse/jgit/util/RawCharSequence;->endPtr:I

    iget v1, p0, Lorg/eclipse/jgit/util/RawCharSequence;->startPtr:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public subSequence(II)Ljava/lang/CharSequence;
    .locals 4
    .parameter "start"
    .parameter "end"

    .prologue
    .line 86
    new-instance v0, Lorg/eclipse/jgit/util/RawCharSequence;

    iget-object v1, p0, Lorg/eclipse/jgit/util/RawCharSequence;->buffer:[B

    iget v2, p0, Lorg/eclipse/jgit/util/RawCharSequence;->startPtr:I

    add-int/2addr v2, p1

    iget v3, p0, Lorg/eclipse/jgit/util/RawCharSequence;->startPtr:I

    add-int/2addr v3, p2

    invoke-direct {v0, v1, v2, v3}, Lorg/eclipse/jgit/util/RawCharSequence;-><init>([BII)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 91
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/RawCharSequence;->length()I

    move-result v2

    .line 92
    .local v2, n:I
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 93
    .local v0, b:Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 94
    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/util/RawCharSequence;->charAt(I)C

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 93
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 95
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
