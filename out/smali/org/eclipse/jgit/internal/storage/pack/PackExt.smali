.class public Lorg/eclipse/jgit/internal/storage/pack/PackExt;
.super Ljava/lang/Object;
.source "PackExt.java"


# static fields
.field public static final BITMAP_INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

.field public static final INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

.field public static final PACK:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

.field private static volatile VALUES:[Lorg/eclipse/jgit/internal/storage/pack/PackExt;


# instance fields
.field private final ext:Ljava/lang/String;

.field private final pos:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 48
    const/4 v0, 0x0

    new-array v0, v0, [Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    sput-object v0, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->VALUES:[Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    .line 51
    const-string v0, "pack"

    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->newPackExt(Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->PACK:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    .line 54
    const-string v0, "idx"

    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->newPackExt(Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    .line 57
    const-string v0, "bitmap"

    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->newPackExt(Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->BITMAP_INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter "ext"
    .parameter "pos"

    .prologue
    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->ext:Ljava/lang/String;

    .line 96
    iput p2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->pos:I

    .line 97
    return-void
.end method

.method public static declared-synchronized newPackExt(Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/pack/PackExt;
    .locals 7
    .parameter "ext"

    .prologue
    .line 73
    const-class v5, Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    monitor-enter v5

    :try_start_0
    sget-object v4, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->VALUES:[Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    array-length v4, v4

    add-int/lit8 v4, v4, 0x1

    new-array v0, v4, [Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    .line 74
    .local v0, dst:[Lorg/eclipse/jgit/internal/storage/pack/PackExt;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    sget-object v4, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->VALUES:[Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    array-length v4, v4

    if-ge v1, v4, :cond_1

    .line 75
    sget-object v4, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->VALUES:[Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    aget-object v2, v4, v1

    .line 76
    .local v2, packExt:Lorg/eclipse/jgit/internal/storage/pack/PackExt;
    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->getExtension()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    if-eqz v4, :cond_0

    .line 87
    .end local v2           #packExt:Lorg/eclipse/jgit/internal/storage/pack/PackExt;
    :goto_1
    monitor-exit v5

    return-object v2

    .line 78
    .restart local v2       #packExt:Lorg/eclipse/jgit/internal/storage/pack/PackExt;
    :cond_0
    :try_start_1
    aput-object v2, v0, v1

    .line 74
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 80
    .end local v2           #packExt:Lorg/eclipse/jgit/internal/storage/pack/PackExt;
    :cond_1
    sget-object v4, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->VALUES:[Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    array-length v4, v4

    const/16 v6, 0x20

    if-lt v4, v6, :cond_2

    .line 81
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v6, "maximum number of pack extensions exceeded"

    invoke-direct {v4, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 73
    .end local v0           #dst:[Lorg/eclipse/jgit/internal/storage/pack/PackExt;
    .end local v1           #i:I
    :catchall_0
    move-exception v4

    monitor-exit v5

    throw v4

    .line 84
    .restart local v0       #dst:[Lorg/eclipse/jgit/internal/storage/pack/PackExt;
    .restart local v1       #i:I
    :cond_2
    :try_start_2
    new-instance v3, Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    sget-object v4, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->VALUES:[Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    array-length v4, v4

    invoke-direct {v3, p0, v4}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;-><init>(Ljava/lang/String;I)V

    .line 85
    .local v3, value:Lorg/eclipse/jgit/internal/storage/pack/PackExt;
    sget-object v4, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->VALUES:[Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    array-length v4, v4

    aput-object v3, v0, v4

    .line 86
    sput-object v0, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->VALUES:[Lorg/eclipse/jgit/internal/storage/pack/PackExt;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object v2, v3

    .line 87
    goto :goto_1
.end method

.method public static values()[Lorg/eclipse/jgit/internal/storage/pack/PackExt;
    .locals 1

    .prologue
    .line 61
    sget-object v0, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->VALUES:[Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    return-object v0
.end method


# virtual methods
.method public getBit()I
    .locals 2

    .prologue
    .line 111
    const/4 v0, 0x1

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->getPosition()I

    move-result v1

    shl-int/2addr v0, v1

    return v0
.end method

.method public getExtension()Ljava/lang/String;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->ext:Ljava/lang/String;

    return-object v0
.end method

.method public getPosition()I
    .locals 1

    .prologue
    .line 106
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->pos:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 116
    const-string v0, "PackExt[%s, bit=0x%s]"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->getExtension()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->getBit()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
