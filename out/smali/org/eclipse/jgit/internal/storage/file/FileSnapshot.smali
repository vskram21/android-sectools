.class public Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;
.super Ljava/lang/Object;
.source "FileSnapshot.java"


# static fields
.field public static final DIRTY:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

.field public static final MISSING_FILE:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;


# instance fields
.field private cannotBeRacilyClean:Z

.field private final lastModified:J

.field private volatile lastRead:J


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const-wide/16 v3, 0x0

    const-wide/16 v1, -0x1

    .line 74
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    invoke-direct {v0, v1, v2, v1, v2}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;-><init>(JJ)V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->DIRTY:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    .line 83
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot$1;

    invoke-direct {v0, v3, v4, v3, v4}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot$1;-><init>(JJ)V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->MISSING_FILE:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    return-void
.end method

.method private constructor <init>(JJ)V
    .locals 1
    .parameter "read"
    .parameter "modified"

    .prologue
    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 132
    iput-wide p1, p0, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->lastRead:J

    .line 133
    iput-wide p3, p0, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->lastModified:J

    .line 134
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->notRacyClean(J)Z

    move-result v0

    iput-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->cannotBeRacilyClean:Z

    .line 135
    return-void
.end method

.method synthetic constructor <init>(JJLorg/eclipse/jgit/internal/storage/file/FileSnapshot$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 66
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;-><init>(JJ)V

    return-void
.end method

.method private isModified(J)Z
    .locals 4
    .parameter "currLastModified"

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 221
    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->lastModified:J

    cmp-long v2, v2, p1

    if-eqz v2, :cond_1

    .line 249
    :cond_0
    :goto_0
    return v0

    .line 228
    :cond_1
    iget-boolean v2, p0, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->cannotBeRacilyClean:Z

    if-eqz v2, :cond_2

    move v0, v1

    .line 229
    goto :goto_0

    .line 231
    :cond_2
    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->lastRead:J

    invoke-direct {p0, v2, v3}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->notRacyClean(J)Z

    move-result v2

    if-eqz v2, :cond_3

    move v0, v1

    .line 236
    goto :goto_0

    .line 240
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->lastRead:J

    .line 241
    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->lastRead:J

    invoke-direct {p0, v2, v3}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->notRacyClean(J)Z

    move-result v2

    if-eqz v2, :cond_0

    move v0, v1

    .line 242
    goto :goto_0
.end method

.method private notRacyClean(J)Z
    .locals 4
    .parameter "read"

    .prologue
    .line 215
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->lastModified:J

    sub-long v0, p1, v0

    const-wide/16 v2, 0x9c4

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static save(J)Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;
    .locals 3
    .parameter "modified"

    .prologue
    .line 118
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 119
    .local v0, read:J
    new-instance v2, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    invoke-direct {v2, v0, v1, p0, p1}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;-><init>(JJ)V

    return-object v2
.end method

.method public static save(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;
    .locals 5
    .parameter "path"

    .prologue
    .line 101
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 102
    .local v2, read:J
    invoke-virtual {p0}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    .line 103
    .local v0, modified:J
    new-instance v4, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    invoke-direct {v4, v2, v3, v0, v1}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;-><init>(JJ)V

    return-object v4
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .parameter "other"

    .prologue
    .line 197
    instance-of v0, p1, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    if-eqz v0, :cond_0

    .line 198
    check-cast p1, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    .end local p1
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->equals(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;)Z

    move-result v0

    .line 199
    :goto_0
    return v0

    .restart local p1
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public equals(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;)Z
    .locals 4
    .parameter "other"

    .prologue
    .line 192
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->lastModified:J

    iget-wide v2, p1, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->lastModified:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 207
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->lastModified:J

    long-to-int v0, v0

    return v0
.end method

.method public isModified(Ljava/io/File;)Z
    .locals 2
    .parameter "path"

    .prologue
    .line 152
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->isModified(J)Z

    move-result v0

    return v0
.end method

.method public lastModified()J
    .locals 2

    .prologue
    .line 141
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->lastModified:J

    return-wide v0
.end method

.method public setClean(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;)V
    .locals 3
    .parameter "other"

    .prologue
    .line 178
    iget-wide v0, p1, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->lastRead:J

    .line 179
    .local v0, now:J
    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->notRacyClean(J)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 180
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->cannotBeRacilyClean:Z

    .line 181
    :cond_0
    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->lastRead:J

    .line 182
    return-void
.end method
