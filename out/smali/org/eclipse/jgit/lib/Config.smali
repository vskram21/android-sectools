.class public Lorg/eclipse/jgit/lib/Config;
.super Ljava/lang/Object;
.source "Config.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/lib/Config$ConfigEnum;,
        Lorg/eclipse/jgit/lib/Config$SectionParser;,
        Lorg/eclipse/jgit/lib/Config$StringReader;
    }
.end annotation


# static fields
.field private static final EMPTY_STRING_ARRAY:[Ljava/lang/String; = null

.field private static final GiB:J = 0x40000000L

.field private static final KiB:J = 0x400L

.field private static final MAGIC_EMPTY_VALUE:Ljava/lang/String; = null

.field private static final MiB:J = 0x100000L


# instance fields
.field private final baseConfig:Lorg/eclipse/jgit/lib/Config;

.field private final listeners:Lorg/eclipse/jgit/events/ListenerList;

.field private final state:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lorg/eclipse/jgit/lib/ConfigSnapshot;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 74
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Lorg/eclipse/jgit/lib/Config;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    .line 99
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0}, Ljava/lang/String;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/lib/Config;->MAGIC_EMPTY_VALUE:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 103
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/lib/Config;-><init>(Lorg/eclipse/jgit/lib/Config;)V

    .line 104
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Config;)V
    .locals 2
    .parameter "defaultConfig"

    .prologue
    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    new-instance v0, Lorg/eclipse/jgit/events/ListenerList;

    invoke-direct {v0}, Lorg/eclipse/jgit/events/ListenerList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/lib/Config;->listeners:Lorg/eclipse/jgit/events/ListenerList;

    .line 114
    iput-object p1, p0, Lorg/eclipse/jgit/lib/Config;->baseConfig:Lorg/eclipse/jgit/lib/Config;

    .line 115
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {p0}, Lorg/eclipse/jgit/lib/Config;->newState()Lorg/eclipse/jgit/lib/ConfigSnapshot;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lorg/eclipse/jgit/lib/Config;->state:Ljava/util/concurrent/atomic/AtomicReference;

    .line 116
    return-void
.end method

.method private static allValuesOf(Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 7
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)[TT;"
        }
    .end annotation

    .prologue
    .local p0, value:Ljava/lang/Object;,"TT;"
    const/4 v6, 0x0

    .line 357
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "values"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v3, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/Object;

    check-cast v3, [Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    .line 358
    :catch_0
    move-exception v0

    .line 359
    .local v0, err:Ljava/lang/Exception;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    .line 360
    .local v2, typeName:Ljava/lang/String;
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->enumValuesNotAvailable:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v2, v4, v6

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 362
    .local v1, msg:Ljava/lang/String;
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3, v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method private static copy(Lorg/eclipse/jgit/lib/ConfigSnapshot;Ljava/util/List;)Ljava/util/List;
    .locals 4
    .parameter "src"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ConfigSnapshot;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/ConfigLine;",
            ">;"
        }
    .end annotation

    .prologue
    .line 948
    .local p1, values:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    iget-object v2, p0, Lorg/eclipse/jgit/lib/ConfigSnapshot;->entryList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    add-int/2addr v2, v3

    add-int/lit8 v0, v2, 0x1

    .line 949
    .local v0, max:I
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 950
    .local v1, r:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/eclipse/jgit/lib/ConfigLine;>;"
    iget-object v2, p0, Lorg/eclipse/jgit/lib/ConfigSnapshot;->entryList:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 951
    return-object v1
.end method

.method private static escapeValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .parameter "x"

    .prologue
    const/16 v7, 0x20

    const/16 v6, 0x22

    .line 126
    const/4 v1, 0x0

    .line 127
    .local v1, inquote:Z
    const/4 v3, 0x0

    .line 128
    .local v3, lineStart:I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 129
    .local v4, r:Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, k:I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v2, v5, :cond_3

    .line 130
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 131
    .local v0, c:C
    sparse-switch v0, :sswitch_data_0

    .line 176
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 129
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 133
    :sswitch_0
    if-eqz v1, :cond_0

    .line 134
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 135
    const/4 v1, 0x0

    .line 137
    :cond_0
    const-string v5, "\\n\\\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    .line 139
    goto :goto_1

    .line 142
    :sswitch_1
    const-string v5, "\\t"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 146
    :sswitch_2
    const-string v5, "\\b"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 150
    :sswitch_3
    const-string v5, "\\\\"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 154
    :sswitch_4
    const-string v5, "\\\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 159
    :sswitch_5
    if-nez v1, :cond_1

    .line 160
    invoke-virtual {v4, v3, v6}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 161
    const/4 v1, 0x1

    .line 163
    :cond_1
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 167
    :sswitch_6
    if-nez v1, :cond_2

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_2

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v5

    if-ne v5, v7, :cond_2

    .line 169
    invoke-virtual {v4, v3, v6}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 170
    const/4 v1, 0x1

    .line 172
    :cond_2
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 180
    .end local v0           #c:C
    :cond_3
    if-eqz v1, :cond_4

    .line 181
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 183
    :cond_4
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 131
    nop

    :sswitch_data_0
    .sparse-switch
        0x8 -> :sswitch_2
        0x9 -> :sswitch_1
        0xa -> :sswitch_0
        0x20 -> :sswitch_6
        0x22 -> :sswitch_4
        0x23 -> :sswitch_5
        0x3b -> :sswitch_5
        0x5c -> :sswitch_3
    .end sparse-switch
.end method

.method private static findSectionEnd(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)I
    .locals 3
    .parameter
    .parameter "section"
    .parameter "subsection"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/ConfigLine;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .prologue
    .line 956
    .local p0, entries:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ConfigLine;>;"
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 957
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/ConfigLine;

    .line 958
    .local v0, e:Lorg/eclipse/jgit/lib/ConfigLine;
    const/4 v2, 0x0

    invoke-virtual {v0, p1, p2, v2}, Lorg/eclipse/jgit/lib/ConfigLine;->match(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 959
    add-int/lit8 v1, v1, 0x1

    .line 960
    :goto_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 961
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0           #e:Lorg/eclipse/jgit/lib/ConfigLine;
    check-cast v0, Lorg/eclipse/jgit/lib/ConfigLine;

    .line 962
    .restart local v0       #e:Lorg/eclipse/jgit/lib/ConfigLine;
    iget-object v2, v0, Lorg/eclipse/jgit/lib/ConfigLine;->name:Ljava/lang/String;

    invoke-virtual {v0, p1, p2, v2}, Lorg/eclipse/jgit/lib/ConfigLine;->match(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 963
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_0
    move v2, v1

    .line 970
    .end local v0           #e:Lorg/eclipse/jgit/lib/ConfigLine;
    :goto_2
    return v2

    .line 956
    .restart local v0       #e:Lorg/eclipse/jgit/lib/ConfigLine;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 970
    .end local v0           #e:Lorg/eclipse/jgit/lib/ConfigLine;
    :cond_2
    const/4 v2, -0x1

    goto :goto_2
.end method

.method private getBaseState()Lorg/eclipse/jgit/lib/ConfigSnapshot;
    .locals 1

    .prologue
    .line 662
    iget-object v0, p0, Lorg/eclipse/jgit/lib/Config;->baseConfig:Lorg/eclipse/jgit/lib/Config;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/lib/Config;->baseConfig:Lorg/eclipse/jgit/lib/Config;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/Config;->getState()Lorg/eclipse/jgit/lib/ConfigSnapshot;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getRawString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "section"
    .parameter "subsection"
    .parameter "name"

    .prologue
    .line 635
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/lib/Config;->getRawStringList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 636
    .local v0, lst:[Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 637
    const/4 v1, 0x0

    aget-object v1, v0, v1

    .line 641
    :goto_0
    return-object v1

    .line 638
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/lib/Config;->baseConfig:Lorg/eclipse/jgit/lib/Config;

    if-eqz v1, :cond_1

    .line 639
    iget-object v1, p0, Lorg/eclipse/jgit/lib/Config;->baseConfig:Lorg/eclipse/jgit/lib/Config;

    invoke-direct {v1, p1, p2, p3}, Lorg/eclipse/jgit/lib/Config;->getRawString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 641
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private getRawStringList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 1
    .parameter "section"
    .parameter "subsection"
    .parameter "name"

    .prologue
    .line 646
    iget-object v0, p0, Lorg/eclipse/jgit/lib/Config;->state:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/ConfigSnapshot;

    invoke-virtual {v0, p1, p2, p3}, Lorg/eclipse/jgit/lib/ConfigSnapshot;->get(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getState()Lorg/eclipse/jgit/lib/ConfigSnapshot;
    .locals 4

    .prologue
    .line 652
    :cond_0
    iget-object v3, p0, Lorg/eclipse/jgit/lib/Config;->state:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/lib/ConfigSnapshot;

    .line 653
    .local v1, cur:Lorg/eclipse/jgit/lib/ConfigSnapshot;
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/Config;->getBaseState()Lorg/eclipse/jgit/lib/ConfigSnapshot;

    move-result-object v0

    .line 654
    .local v0, base:Lorg/eclipse/jgit/lib/ConfigSnapshot;
    iget-object v3, v1, Lorg/eclipse/jgit/lib/ConfigSnapshot;->baseState:Lorg/eclipse/jgit/lib/ConfigSnapshot;

    if-ne v3, v0, :cond_1

    .line 658
    .end local v1           #cur:Lorg/eclipse/jgit/lib/ConfigSnapshot;
    :goto_0
    return-object v1

    .line 656
    .restart local v1       #cur:Lorg/eclipse/jgit/lib/ConfigSnapshot;
    :cond_1
    new-instance v2, Lorg/eclipse/jgit/lib/ConfigSnapshot;

    iget-object v3, v1, Lorg/eclipse/jgit/lib/ConfigSnapshot;->entryList:Ljava/util/List;

    invoke-direct {v2, v3, v0}, Lorg/eclipse/jgit/lib/ConfigSnapshot;-><init>(Ljava/util/List;Lorg/eclipse/jgit/lib/ConfigSnapshot;)V

    .line 657
    .local v2, upd:Lorg/eclipse/jgit/lib/ConfigSnapshot;
    iget-object v3, p0, Lorg/eclipse/jgit/lib/Config;->state:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3, v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    move-object v1, v2

    .line 658
    goto :goto_0
.end method

.method private newState()Lorg/eclipse/jgit/lib/ConfigSnapshot;
    .locals 3

    .prologue
    .line 1094
    new-instance v0, Lorg/eclipse/jgit/lib/ConfigSnapshot;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    invoke-direct {p0}, Lorg/eclipse/jgit/lib/Config;->getBaseState()Lorg/eclipse/jgit/lib/ConfigSnapshot;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/ConfigSnapshot;-><init>(Ljava/util/List;Lorg/eclipse/jgit/lib/ConfigSnapshot;)V

    return-object v0
.end method

.method private newState(Ljava/util/List;)Lorg/eclipse/jgit/lib/ConfigSnapshot;
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/ConfigLine;",
            ">;)",
            "Lorg/eclipse/jgit/lib/ConfigSnapshot;"
        }
    .end annotation

    .prologue
    .line 1099
    .local p1, entries:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ConfigLine;>;"
    new-instance v0, Lorg/eclipse/jgit/lib/ConfigSnapshot;

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-direct {p0}, Lorg/eclipse/jgit/lib/Config;->getBaseState()Lorg/eclipse/jgit/lib/ConfigSnapshot;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/ConfigSnapshot;-><init>(Ljava/util/List;Lorg/eclipse/jgit/lib/ConfigSnapshot;)V

    return-object v0
.end method

.method private static readKeyName(Lorg/eclipse/jgit/lib/Config$StringReader;)Ljava/lang/String;
    .locals 7
    .parameter "in"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/ConfigInvalidException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x3d

    const/16 v5, 0x20

    const/16 v4, 0xa

    const/16 v3, 0x9

    .line 1151
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 1153
    .local v1, name:Ljava/lang/StringBuilder;
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Config$StringReader;->read()I

    move-result v0

    .line 1154
    .local v0, c:I
    if-gez v0, :cond_0

    .line 1155
    new-instance v2, Lorg/eclipse/jgit/errors/ConfigInvalidException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->unexpectedEndOfConfigFile:Ljava/lang/String;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/ConfigInvalidException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1157
    :cond_0
    if-ne v6, v0, :cond_2

    .line 1193
    :cond_1
    :goto_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1160
    :cond_2
    if-eq v5, v0, :cond_3

    if-ne v3, v0, :cond_7

    .line 1162
    :cond_3
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Config$StringReader;->read()I

    move-result v0

    .line 1163
    if-gez v0, :cond_4

    .line 1164
    new-instance v2, Lorg/eclipse/jgit/errors/ConfigInvalidException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->unexpectedEndOfConfigFile:Ljava/lang/String;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/ConfigInvalidException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1166
    :cond_4
    if-eq v6, v0, :cond_1

    .line 1169
    const/16 v2, 0x3b

    if-eq v2, v0, :cond_5

    const/16 v2, 0x23

    if-eq v2, v0, :cond_5

    if-ne v4, v0, :cond_6

    .line 1170
    :cond_5
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Config$StringReader;->reset()V

    goto :goto_1

    .line 1174
    :cond_6
    if-eq v5, v0, :cond_3

    if-eq v3, v0, :cond_3

    .line 1176
    new-instance v2, Lorg/eclipse/jgit/errors/ConfigInvalidException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->badEntryDelimiter:Ljava/lang/String;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/ConfigInvalidException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1181
    :cond_7
    int-to-char v2, v0

    invoke-static {v2}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v2

    if-nez v2, :cond_8

    const/16 v2, 0x2d

    if-ne v0, v2, :cond_9

    .line 1185
    :cond_8
    int-to-char v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 1186
    :cond_9
    if-ne v4, v0, :cond_a

    .line 1187
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Config$StringReader;->reset()V

    .line 1188
    int-to-char v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 1191
    :cond_a
    new-instance v2, Lorg/eclipse/jgit/errors/ConfigInvalidException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->badEntryName:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/ConfigInvalidException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private static readSectionName(Lorg/eclipse/jgit/lib/Config$StringReader;)Ljava/lang/String;
    .locals 7
    .parameter "in"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/ConfigInvalidException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x20

    const/16 v3, 0x9

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 1112
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 1114
    .local v1, name:Ljava/lang/StringBuilder;
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Config$StringReader;->read()I

    move-result v0

    .line 1115
    .local v0, c:I
    if-gez v0, :cond_0

    .line 1116
    new-instance v2, Lorg/eclipse/jgit/errors/ConfigInvalidException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->unexpectedEndOfConfigFile:Ljava/lang/String;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/ConfigInvalidException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1118
    :cond_0
    const/16 v2, 0x5d

    if-ne v2, v0, :cond_1

    .line 1119
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Config$StringReader;->reset()V

    .line 1146
    :goto_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1123
    :cond_1
    if-eq v6, v0, :cond_2

    if-ne v3, v0, :cond_5

    .line 1125
    :cond_2
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Config$StringReader;->read()I

    move-result v0

    .line 1126
    if-gez v0, :cond_3

    .line 1127
    new-instance v2, Lorg/eclipse/jgit/errors/ConfigInvalidException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->unexpectedEndOfConfigFile:Ljava/lang/String;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/ConfigInvalidException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1129
    :cond_3
    const/16 v2, 0x22

    if-ne v2, v0, :cond_4

    .line 1130
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Config$StringReader;->reset()V

    goto :goto_1

    .line 1134
    :cond_4
    if-eq v6, v0, :cond_2

    if-eq v3, v0, :cond_2

    .line 1136
    new-instance v2, Lorg/eclipse/jgit/errors/ConfigInvalidException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->badSectionEntry:Ljava/lang/String;

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v1, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/ConfigInvalidException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1141
    :cond_5
    int-to-char v2, v0

    invoke-static {v2}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v2

    if-nez v2, :cond_6

    const/16 v2, 0x2e

    if-eq v2, v0, :cond_6

    const/16 v2, 0x2d

    if-ne v2, v0, :cond_7

    .line 1142
    :cond_6
    int-to-char v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 1144
    :cond_7
    new-instance v2, Lorg/eclipse/jgit/errors/ConfigInvalidException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->badSectionEntry:Ljava/lang/String;

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v1, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/ConfigInvalidException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private static readValue(Lorg/eclipse/jgit/lib/Config$StringReader;ZI)Ljava/lang/String;
    .locals 9
    .parameter "in"
    .parameter "quote"
    .parameter "eol"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/ConfigInvalidException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x5c

    const/16 v7, 0x22

    const/16 v6, 0xa

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 1198
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 1199
    .local v2, value:Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 1201
    .local v1, space:Z
    :goto_0
    :sswitch_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Config$StringReader;->read()I

    move-result v0

    .line 1202
    .local v0, c:I
    if-gez v0, :cond_0

    .line 1203
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-nez v3, :cond_2

    .line 1204
    new-instance v3, Lorg/eclipse/jgit/errors/ConfigInvalidException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->unexpectedEndOfConfigFile:Ljava/lang/String;

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/errors/ConfigInvalidException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1208
    :cond_0
    if-ne v6, v0, :cond_3

    .line 1209
    if-eqz p1, :cond_1

    .line 1210
    new-instance v3, Lorg/eclipse/jgit/errors/ConfigInvalidException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->newlineInQuotesNotAllowed:Ljava/lang/String;

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/errors/ConfigInvalidException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1211
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Config$StringReader;->reset()V

    .line 1271
    :cond_2
    :goto_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_c

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_2
    return-object v3

    .line 1215
    :cond_3
    if-eq p2, v0, :cond_2

    .line 1218
    if-nez p1, :cond_6

    .line 1219
    int-to-char v5, v0

    invoke-static {v5}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 1220
    const/4 v1, 0x1

    .line 1221
    goto :goto_0

    .line 1223
    :cond_4
    const/16 v5, 0x3b

    if-eq v5, v0, :cond_5

    const/16 v5, 0x23

    if-ne v5, v0, :cond_6

    .line 1224
    :cond_5
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Config$StringReader;->reset()V

    goto :goto_1

    .line 1229
    :cond_6
    if-eqz v1, :cond_8

    .line 1230
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_7

    .line 1231
    const/16 v5, 0x20

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1232
    :cond_7
    const/4 v1, 0x0

    .line 1235
    :cond_8
    if-ne v8, v0, :cond_9

    .line 1236
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Config$StringReader;->read()I

    move-result v0

    .line 1237
    sparse-switch v0, :sswitch_data_0

    .line 1258
    new-instance v5, Lorg/eclipse/jgit/errors/ConfigInvalidException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/internal/JGitText;->badEscape:Ljava/lang/String;

    new-array v3, v3, [Ljava/lang/Object;

    int-to-char v7, v0

    invoke-static {v7}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v7

    aput-object v7, v3, v4

    invoke-static {v6, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v5, v3}, Lorg/eclipse/jgit/errors/ConfigInvalidException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1239
    :sswitch_1
    new-instance v3, Lorg/eclipse/jgit/errors/ConfigInvalidException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->endOfFileInEscape:Ljava/lang/String;

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/errors/ConfigInvalidException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1243
    :sswitch_2
    const/16 v5, 0x9

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 1246
    :sswitch_3
    const/16 v5, 0x8

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 1249
    :sswitch_4
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 1252
    :sswitch_5
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 1255
    :sswitch_6
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 1264
    :cond_9
    if-ne v7, v0, :cond_b

    .line 1265
    if-nez p1, :cond_a

    move p1, v3

    .line 1266
    :goto_3
    goto/16 :goto_0

    :cond_a
    move p1, v4

    .line 1265
    goto :goto_3

    .line 1269
    :cond_b
    int-to-char v5, v0

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 1271
    :cond_c
    const/4 v3, 0x0

    goto/16 :goto_2

    .line 1237
    :sswitch_data_0
    .sparse-switch
        -0x1 -> :sswitch_1
        0xa -> :sswitch_0
        0x22 -> :sswitch_6
        0x5c -> :sswitch_5
        0x62 -> :sswitch_3
        0x6e -> :sswitch_4
        0x74 -> :sswitch_2
    .end sparse-switch
.end method

.method private replaceStringList(Lorg/eclipse/jgit/lib/ConfigSnapshot;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lorg/eclipse/jgit/lib/ConfigSnapshot;
    .locals 9
    .parameter "srcState"
    .parameter "section"
    .parameter "subsection"
    .parameter "name"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ConfigSnapshot;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/eclipse/jgit/lib/ConfigSnapshot;"
        }
    .end annotation

    .prologue
    .line 884
    .local p5, values:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {p1, p5}, Lorg/eclipse/jgit/lib/Config;->copy(Lorg/eclipse/jgit/lib/ConfigSnapshot;Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 885
    .local v1, entries:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ConfigLine;>;"
    const/4 v2, 0x0

    .line 886
    .local v2, entryIndex:I
    const/4 v6, 0x0

    .line 887
    .local v6, valueIndex:I
    const/4 v4, -0x1

    .line 891
    .local v4, insertPosition:I
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v8

    if-ge v2, v8, :cond_1

    invoke-interface {p5}, Ljava/util/List;->size()I

    move-result v8

    if-ge v6, v8, :cond_1

    .line 892
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/ConfigLine;

    .line 893
    .local v0, e:Lorg/eclipse/jgit/lib/ConfigLine;
    invoke-virtual {v0, p2, p3, p4}, Lorg/eclipse/jgit/lib/ConfigLine;->match(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 894
    add-int/lit8 v7, v6, 0x1

    .end local v6           #valueIndex:I
    .local v7, valueIndex:I
    invoke-interface {p5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v0, v8}, Lorg/eclipse/jgit/lib/ConfigLine;->forValue(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ConfigLine;

    move-result-object v8

    invoke-interface {v1, v2, v8}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 895
    add-int/lit8 v4, v2, 0x1

    move v6, v7

    .line 897
    .end local v7           #valueIndex:I
    .restart local v6       #valueIndex:I
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 898
    goto :goto_0

    .line 902
    .end local v0           #e:Lorg/eclipse/jgit/lib/ConfigLine;
    :cond_1
    invoke-interface {p5}, Ljava/util/List;->size()I

    move-result v8

    if-ne v6, v8, :cond_2

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v8

    if-ge v2, v8, :cond_2

    .line 903
    :goto_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v8

    if-ge v2, v8, :cond_2

    .line 904
    add-int/lit8 v3, v2, 0x1

    .end local v2           #entryIndex:I
    .local v3, entryIndex:I
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/ConfigLine;

    .line 905
    .restart local v0       #e:Lorg/eclipse/jgit/lib/ConfigLine;
    invoke-virtual {v0, p2, p3, p4}, Lorg/eclipse/jgit/lib/ConfigLine;->match(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 906
    add-int/lit8 v2, v3, -0x1

    .end local v3           #entryIndex:I
    .restart local v2       #entryIndex:I
    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_1

    .line 912
    .end local v0           #e:Lorg/eclipse/jgit/lib/ConfigLine;
    :cond_2
    invoke-interface {p5}, Ljava/util/List;->size()I

    move-result v8

    if-ge v6, v8, :cond_5

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v8

    if-ne v2, v8, :cond_5

    .line 913
    if-gez v4, :cond_3

    .line 918
    invoke-static {v1, p2, p3}, Lorg/eclipse/jgit/lib/Config;->findSectionEnd(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    .line 920
    :cond_3
    if-gez v4, :cond_4

    .line 924
    new-instance v0, Lorg/eclipse/jgit/lib/ConfigLine;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/ConfigLine;-><init>()V

    .line 925
    .restart local v0       #e:Lorg/eclipse/jgit/lib/ConfigLine;
    iput-object p2, v0, Lorg/eclipse/jgit/lib/ConfigLine;->section:Ljava/lang/String;

    .line 926
    iput-object p3, v0, Lorg/eclipse/jgit/lib/ConfigLine;->subsection:Ljava/lang/String;

    .line 927
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 928
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    .line 930
    .end local v0           #e:Lorg/eclipse/jgit/lib/ConfigLine;
    :cond_4
    :goto_2
    invoke-interface {p5}, Ljava/util/List;->size()I

    move-result v8

    if-ge v6, v8, :cond_5

    .line 931
    new-instance v0, Lorg/eclipse/jgit/lib/ConfigLine;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/ConfigLine;-><init>()V

    .line 932
    .restart local v0       #e:Lorg/eclipse/jgit/lib/ConfigLine;
    iput-object p2, v0, Lorg/eclipse/jgit/lib/ConfigLine;->section:Ljava/lang/String;

    .line 933
    iput-object p3, v0, Lorg/eclipse/jgit/lib/ConfigLine;->subsection:Ljava/lang/String;

    .line 934
    iput-object p4, v0, Lorg/eclipse/jgit/lib/ConfigLine;->name:Ljava/lang/String;

    .line 935
    add-int/lit8 v7, v6, 0x1

    .end local v6           #valueIndex:I
    .restart local v7       #valueIndex:I
    invoke-interface {p5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    iput-object v8, v0, Lorg/eclipse/jgit/lib/ConfigLine;->value:Ljava/lang/String;

    .line 936
    add-int/lit8 v5, v4, 0x1

    .end local v4           #insertPosition:I
    .local v5, insertPosition:I
    invoke-interface {v1, v4, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    move v4, v5

    .end local v5           #insertPosition:I
    .restart local v4       #insertPosition:I
    move v6, v7

    .line 937
    .end local v7           #valueIndex:I
    .restart local v6       #valueIndex:I
    goto :goto_2

    .line 940
    .end local v0           #e:Lorg/eclipse/jgit/lib/ConfigLine;
    :cond_5
    invoke-direct {p0, v1}, Lorg/eclipse/jgit/lib/Config;->newState(Ljava/util/List;)Lorg/eclipse/jgit/lib/ConfigSnapshot;

    move-result-object v8

    return-object v8

    .end local v2           #entryIndex:I
    .restart local v0       #e:Lorg/eclipse/jgit/lib/ConfigLine;
    .restart local v3       #entryIndex:I
    :cond_6
    move v2, v3

    .end local v3           #entryIndex:I
    .restart local v2       #entryIndex:I
    goto :goto_1
.end method

.method private unsetSection(Lorg/eclipse/jgit/lib/ConfigSnapshot;Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/lib/ConfigSnapshot;
    .locals 6
    .parameter "srcState"
    .parameter "section"
    .parameter "subsection"

    .prologue
    .line 834
    iget-object v5, p1, Lorg/eclipse/jgit/lib/ConfigSnapshot;->entryList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v3

    .line 835
    .local v3, max:I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 837
    .local v4, r:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/eclipse/jgit/lib/ConfigLine;>;"
    const/4 v2, 0x0

    .line 838
    .local v2, lastWasMatch:Z
    iget-object v5, p1, Lorg/eclipse/jgit/lib/ConfigSnapshot;->entryList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/ConfigLine;

    .line 839
    .local v0, e:Lorg/eclipse/jgit/lib/ConfigLine;
    invoke-virtual {v0, p2, p3}, Lorg/eclipse/jgit/lib/ConfigLine;->match(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 841
    const/4 v2, 0x1

    .line 842
    goto :goto_0

    .line 845
    :cond_1
    if-eqz v2, :cond_2

    iget-object v5, v0, Lorg/eclipse/jgit/lib/ConfigLine;->section:Ljava/lang/String;

    if-nez v5, :cond_2

    iget-object v5, v0, Lorg/eclipse/jgit/lib/ConfigLine;->subsection:Ljava/lang/String;

    if-eqz v5, :cond_0

    .line 847
    :cond_2
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 850
    .end local v0           #e:Lorg/eclipse/jgit/lib/ConfigLine;
    :cond_3
    invoke-direct {p0, v4}, Lorg/eclipse/jgit/lib/Config;->newState(Ljava/util/List;)Lorg/eclipse/jgit/lib/ConfigSnapshot;

    move-result-object v5

    return-object v5
.end method


# virtual methods
.method public addChangeListener(Lorg/eclipse/jgit/events/ConfigChangedListener;)Lorg/eclipse/jgit/events/ListenerHandle;
    .locals 1
    .parameter "listener"

    .prologue
    .line 607
    iget-object v0, p0, Lorg/eclipse/jgit/lib/Config;->listeners:Lorg/eclipse/jgit/events/ListenerList;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/events/ListenerList;->addConfigChangedListener(Lorg/eclipse/jgit/events/ConfigChangedListener;)Lorg/eclipse/jgit/events/ListenerHandle;

    move-result-object v0

    return-object v0
.end method

.method protected clear()V
    .locals 2

    .prologue
    .line 1107
    iget-object v0, p0, Lorg/eclipse/jgit/lib/Config;->state:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {p0}, Lorg/eclipse/jgit/lib/Config;->newState()Lorg/eclipse/jgit/lib/ConfigSnapshot;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 1108
    return-void
.end method

.method protected fireConfigChangedEvent()V
    .locals 2

    .prologue
    .line 630
    iget-object v0, p0, Lorg/eclipse/jgit/lib/Config;->listeners:Lorg/eclipse/jgit/events/ListenerList;

    new-instance v1, Lorg/eclipse/jgit/events/ConfigChangedEvent;

    invoke-direct {v1}, Lorg/eclipse/jgit/events/ConfigChangedEvent;-><init>()V

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/events/ListenerList;->dispatch(Lorg/eclipse/jgit/events/RepositoryEvent;)V

    .line 631
    return-void
.end method

.method public fromText(Ljava/lang/String;)V
    .locals 11
    .parameter "text"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/ConfigInvalidException;
        }
    .end annotation

    .prologue
    const/16 v10, 0x22

    const/4 v9, 0x0

    const/4 v8, -0x1

    .line 1028
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 1029
    .local v5, newEntries:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ConfigLine;>;"
    new-instance v2, Lorg/eclipse/jgit/lib/Config$StringReader;

    invoke-direct {v2, p1}, Lorg/eclipse/jgit/lib/Config$StringReader;-><init>(Ljava/lang/String;)V

    .line 1030
    .local v2, in:Lorg/eclipse/jgit/lib/Config$StringReader;
    const/4 v4, 0x0

    .line 1031
    .local v4, last:Lorg/eclipse/jgit/lib/ConfigLine;
    new-instance v1, Lorg/eclipse/jgit/lib/ConfigLine;

    invoke-direct {v1}, Lorg/eclipse/jgit/lib/ConfigLine;-><init>()V

    .line 1033
    .local v1, e:Lorg/eclipse/jgit/lib/ConfigLine;
    :goto_0
    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/Config$StringReader;->read()I

    move-result v3

    .line 1034
    .local v3, input:I
    if-ne v8, v3, :cond_1

    .line 1035
    iget-object v6, v1, Lorg/eclipse/jgit/lib/ConfigLine;->section:Ljava/lang/String;

    if-eqz v6, :cond_0

    .line 1036
    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1090
    :cond_0
    iget-object v6, p0, Lorg/eclipse/jgit/lib/Config;->state:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {p0, v5}, Lorg/eclipse/jgit/lib/Config;->newState(Ljava/util/List;)Lorg/eclipse/jgit/lib/ConfigSnapshot;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 1091
    return-void

    .line 1040
    :cond_1
    int-to-char v0, v3

    .line 1041
    .local v0, c:C
    const/16 v6, 0xa

    if-ne v6, v0, :cond_3

    .line 1043
    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1044
    iget-object v6, v1, Lorg/eclipse/jgit/lib/ConfigLine;->section:Ljava/lang/String;

    if-eqz v6, :cond_2

    .line 1045
    move-object v4, v1

    .line 1046
    :cond_2
    new-instance v1, Lorg/eclipse/jgit/lib/ConfigLine;

    .end local v1           #e:Lorg/eclipse/jgit/lib/ConfigLine;
    invoke-direct {v1}, Lorg/eclipse/jgit/lib/ConfigLine;-><init>()V

    .restart local v1       #e:Lorg/eclipse/jgit/lib/ConfigLine;
    goto :goto_0

    .line 1048
    :cond_3
    iget-object v6, v1, Lorg/eclipse/jgit/lib/ConfigLine;->suffix:Ljava/lang/String;

    if-eqz v6, :cond_4

    .line 1050
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, v1, Lorg/eclipse/jgit/lib/ConfigLine;->suffix:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v1, Lorg/eclipse/jgit/lib/ConfigLine;->suffix:Ljava/lang/String;

    goto :goto_0

    .line 1052
    :cond_4
    const/16 v6, 0x3b

    if-eq v6, v0, :cond_5

    const/16 v6, 0x23

    if-ne v6, v0, :cond_6

    .line 1054
    :cond_5
    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v1, Lorg/eclipse/jgit/lib/ConfigLine;->suffix:Ljava/lang/String;

    goto :goto_0

    .line 1056
    :cond_6
    iget-object v6, v1, Lorg/eclipse/jgit/lib/ConfigLine;->section:Ljava/lang/String;

    if-nez v6, :cond_8

    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 1058
    iget-object v6, v1, Lorg/eclipse/jgit/lib/ConfigLine;->prefix:Ljava/lang/String;

    if-nez v6, :cond_7

    .line 1059
    const-string v6, ""

    iput-object v6, v1, Lorg/eclipse/jgit/lib/ConfigLine;->prefix:Ljava/lang/String;

    .line 1060
    :cond_7
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, v1, Lorg/eclipse/jgit/lib/ConfigLine;->prefix:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v1, Lorg/eclipse/jgit/lib/ConfigLine;->prefix:Ljava/lang/String;

    goto :goto_0

    .line 1062
    :cond_8
    const/16 v6, 0x5b

    if-ne v6, v0, :cond_b

    .line 1064
    invoke-static {v2}, Lorg/eclipse/jgit/lib/Config;->readSectionName(Lorg/eclipse/jgit/lib/Config$StringReader;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v1, Lorg/eclipse/jgit/lib/ConfigLine;->section:Ljava/lang/String;

    .line 1065
    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/Config$StringReader;->read()I

    move-result v3

    .line 1066
    if-ne v10, v3, :cond_9

    .line 1067
    const/4 v6, 0x1

    invoke-static {v2, v6, v10}, Lorg/eclipse/jgit/lib/Config;->readValue(Lorg/eclipse/jgit/lib/Config$StringReader;ZI)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v1, Lorg/eclipse/jgit/lib/ConfigLine;->subsection:Ljava/lang/String;

    .line 1068
    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/Config$StringReader;->read()I

    move-result v3

    .line 1070
    :cond_9
    const/16 v6, 0x5d

    if-eq v6, v3, :cond_a

    .line 1071
    new-instance v6, Lorg/eclipse/jgit/errors/ConfigInvalidException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->badGroupHeader:Ljava/lang/String;

    invoke-direct {v6, v7}, Lorg/eclipse/jgit/errors/ConfigInvalidException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1072
    :cond_a
    const-string v6, ""

    iput-object v6, v1, Lorg/eclipse/jgit/lib/ConfigLine;->suffix:Ljava/lang/String;

    goto/16 :goto_0

    .line 1074
    :cond_b
    if-eqz v4, :cond_d

    .line 1076
    iget-object v6, v4, Lorg/eclipse/jgit/lib/ConfigLine;->section:Ljava/lang/String;

    iput-object v6, v1, Lorg/eclipse/jgit/lib/ConfigLine;->section:Ljava/lang/String;

    .line 1077
    iget-object v6, v4, Lorg/eclipse/jgit/lib/ConfigLine;->subsection:Ljava/lang/String;

    iput-object v6, v1, Lorg/eclipse/jgit/lib/ConfigLine;->subsection:Ljava/lang/String;

    .line 1078
    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/Config$StringReader;->reset()V

    .line 1079
    invoke-static {v2}, Lorg/eclipse/jgit/lib/Config;->readKeyName(Lorg/eclipse/jgit/lib/Config$StringReader;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v1, Lorg/eclipse/jgit/lib/ConfigLine;->name:Ljava/lang/String;

    .line 1080
    iget-object v6, v1, Lorg/eclipse/jgit/lib/ConfigLine;->name:Ljava/lang/String;

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_c

    .line 1081
    iget-object v6, v1, Lorg/eclipse/jgit/lib/ConfigLine;->name:Ljava/lang/String;

    iget-object v7, v1, Lorg/eclipse/jgit/lib/ConfigLine;->name:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v6, v9, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v1, Lorg/eclipse/jgit/lib/ConfigLine;->name:Ljava/lang/String;

    .line 1082
    sget-object v6, Lorg/eclipse/jgit/lib/Config;->MAGIC_EMPTY_VALUE:Ljava/lang/String;

    iput-object v6, v1, Lorg/eclipse/jgit/lib/ConfigLine;->value:Ljava/lang/String;

    goto/16 :goto_0

    .line 1084
    :cond_c
    invoke-static {v2, v9, v8}, Lorg/eclipse/jgit/lib/Config;->readValue(Lorg/eclipse/jgit/lib/Config$StringReader;ZI)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v1, Lorg/eclipse/jgit/lib/ConfigLine;->value:Ljava/lang/String;

    goto/16 :goto_0

    .line 1087
    :cond_d
    new-instance v6, Lorg/eclipse/jgit/errors/ConfigInvalidException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->invalidLineInConfigFile:Ljava/lang/String;

    invoke-direct {v6, v7}, Lorg/eclipse/jgit/errors/ConfigInvalidException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method public get(Lorg/eclipse/jgit/lib/Config$SectionParser;)Ljava/lang/Object;
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/eclipse/jgit/lib/Config$SectionParser",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 573
    .local p1, parser:Lorg/eclipse/jgit/lib/Config$SectionParser;,"Lorg/eclipse/jgit/lib/Config$SectionParser<TT;>;"
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/Config;->getState()Lorg/eclipse/jgit/lib/ConfigSnapshot;

    move-result-object v0

    .line 574
    .local v0, myState:Lorg/eclipse/jgit/lib/ConfigSnapshot;
    iget-object v2, v0, Lorg/eclipse/jgit/lib/ConfigSnapshot;->cache:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 575
    .local v1, obj:Ljava/lang/Object;,"TT;"
    if-nez v1, :cond_0

    .line 576
    invoke-interface {p1, p0}, Lorg/eclipse/jgit/lib/Config$SectionParser;->parse(Lorg/eclipse/jgit/lib/Config;)Ljava/lang/Object;

    move-result-object v1

    .line 577
    iget-object v2, v0, Lorg/eclipse/jgit/lib/ConfigSnapshot;->cache:Ljava/util/Map;

    invoke-interface {v2, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 579
    :cond_0
    return-object v1
.end method

.method public getBoolean(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z
    .locals 7
    .parameter "section"
    .parameter "subsection"
    .parameter "name"
    .parameter "defaultValue"

    .prologue
    const/4 v2, 0x1

    .line 320
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/lib/Config;->getRawString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 321
    .local v1, n:Ljava/lang/String;
    if-nez v1, :cond_0

    .line 326
    .end local p4
    :goto_0
    return p4

    .line 323
    .restart local p4
    :cond_0
    sget-object v3, Lorg/eclipse/jgit/lib/Config;->MAGIC_EMPTY_VALUE:Ljava/lang/String;

    if-ne v3, v1, :cond_1

    move p4, v2

    .line 324
    goto :goto_0

    .line 326
    :cond_1
    :try_start_0
    invoke-static {v1}, Lorg/eclipse/jgit/util/StringUtils;->toBoolean(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result p4

    goto :goto_0

    .line 327
    :catch_0
    move-exception v0

    .line 328
    .local v0, err:Ljava/lang/IllegalArgumentException;
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->invalidBooleanValue:Ljava/lang/String;

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    aput-object p3, v5, v2

    const/4 v2, 0x2

    aput-object v1, v5, v2

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z
    .locals 1
    .parameter "section"
    .parameter "name"
    .parameter "defaultValue"

    .prologue
    .line 301
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2, p3}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public getEnum(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Enum;)Ljava/lang/Enum;
    .locals 6
    .parameter "section"
    .parameter "subsection"
    .parameter "name"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Enum",
            "<*>;>(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "TT;)TT;"
        }
    .end annotation

    .prologue
    .line 350
    .local p4, defaultValue:Ljava/lang/Enum;,"TT;"
    invoke-static {p4}, Lorg/eclipse/jgit/lib/Config;->allValuesOf(Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Enum;

    .local v1, all:[Ljava/lang/Enum;,"[TT;"
    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    .line 351
    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/lib/Config;->getEnum([Ljava/lang/Enum;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Enum;)Ljava/lang/Enum;

    move-result-object v0

    return-object v0
.end method

.method public getEnum([Ljava/lang/Enum;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Enum;)Ljava/lang/Enum;
    .locals 17
    .parameter
    .parameter "section"
    .parameter "subsection"
    .parameter "name"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Enum",
            "<*>;>([TT;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "TT;)TT;"
        }
    .end annotation

    .prologue
    .line 386
    .local p1, all:[Ljava/lang/Enum;,"[TT;"
    .local p5, defaultValue:Ljava/lang/Enum;,"TT;"
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-virtual {v0, v1, v2, v3}, Lorg/eclipse/jgit/lib/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 387
    .local v12, value:Ljava/lang/String;
    if-nez v12, :cond_0

    .line 421
    .end local p5           #defaultValue:Ljava/lang/Enum;,"TT;"
    :goto_0
    return-object p5

    .line 390
    .restart local p5       #defaultValue:Ljava/lang/Enum;,"TT;"
    :cond_0
    const/4 v13, 0x0

    aget-object v13, p1, v13

    instance-of v13, v13, Lorg/eclipse/jgit/lib/Config$ConfigEnum;

    if-eqz v13, :cond_2

    .line 391
    move-object/from16 v4, p1

    .local v4, arr$:[Ljava/lang/Enum;
    array-length v8, v4

    .local v8, len$:I
    const/4 v7, 0x0

    .local v7, i$:I
    :goto_1
    if-ge v7, v8, :cond_2

    aget-object v10, v4, v7

    .local v10, t:Ljava/lang/Enum;,"TT;"
    move-object v13, v10

    .line 392
    check-cast v13, Lorg/eclipse/jgit/lib/Config$ConfigEnum;

    invoke-interface {v13, v12}, Lorg/eclipse/jgit/lib/Config$ConfigEnum;->matchConfigValue(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_1

    move-object/from16 p5, v10

    .line 393
    goto :goto_0

    .line 391
    :cond_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 397
    .end local v4           #arr$:[Ljava/lang/Enum;
    .end local v7           #i$:I
    .end local v8           #len$:I
    .end local v10           #t:Ljava/lang/Enum;,"TT;"
    :cond_2
    const/16 v13, 0x20

    const/16 v14, 0x5f

    invoke-virtual {v12, v13, v14}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v9

    .line 402
    .local v9, n:Ljava/lang/String;
    const/16 v13, 0x2d

    const/16 v14, 0x5f

    invoke-virtual {v9, v13, v14}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v9

    .line 404
    const/4 v11, 0x0

    .line 405
    .local v11, trueState:Ljava/lang/Enum;,"TT;"
    const/4 v6, 0x0

    .line 406
    .local v6, falseState:Ljava/lang/Enum;,"TT;"
    move-object/from16 v4, p1

    .restart local v4       #arr$:[Ljava/lang/Enum;
    array-length v8, v4

    .restart local v8       #len$:I
    const/4 v7, 0x0

    .restart local v7       #i$:I
    :goto_2
    if-ge v7, v8, :cond_6

    aget-object v5, v4, v7

    .line 407
    .local v5, e:Ljava/lang/Enum;,"TT;"
    invoke-virtual {v5}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13, v9}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_3

    move-object/from16 p5, v5

    .line 408
    goto :goto_0

    .line 409
    :cond_3
    invoke-virtual {v5}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v13

    const-string v14, "TRUE"

    invoke-static {v13, v14}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_5

    .line 410
    move-object v11, v5

    .line 406
    :cond_4
    :goto_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 411
    :cond_5
    invoke-virtual {v5}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v13

    const-string v14, "FALSE"

    invoke-static {v13, v14}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_4

    .line 412
    move-object v6, v5

    goto :goto_3

    .line 419
    .end local v5           #e:Ljava/lang/Enum;,"TT;"
    :cond_6
    if-eqz v11, :cond_8

    if-eqz v6, :cond_8

    .line 421
    :try_start_0
    invoke-static {v9}, Lorg/eclipse/jgit/util/StringUtils;->toBoolean(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v13

    if-eqz v13, :cond_7

    .end local v11           #trueState:Ljava/lang/Enum;,"TT;"
    :goto_4
    move-object/from16 p5, v11

    goto :goto_0

    .restart local v11       #trueState:Ljava/lang/Enum;,"TT;"
    :cond_7
    move-object v11, v6

    goto :goto_4

    .line 422
    :catch_0
    move-exception v13

    .line 427
    :cond_8
    if-eqz p3, :cond_9

    .line 428
    new-instance v13, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v14

    iget-object v14, v14, Lorg/eclipse/jgit/internal/JGitText;->enumValueNotSupported3:Ljava/lang/String;

    const/4 v15, 0x4

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object p2, v15, v16

    const/16 v16, 0x1

    aput-object p3, v15, v16

    const/16 v16, 0x2

    aput-object p4, v15, v16

    const/16 v16, 0x3

    aput-object v12, v15, v16

    invoke-static {v14, v15}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 432
    :cond_9
    new-instance v13, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v14

    iget-object v14, v14, Lorg/eclipse/jgit/internal/JGitText;->enumValueNotSupported2:Ljava/lang/String;

    const/4 v15, 0x3

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object p2, v15, v16

    const/16 v16, 0x1

    aput-object p4, v15, v16

    const/16 v16, 0x2

    aput-object v12, v15, v16

    invoke-static {v14, v15}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v13
.end method

.method public getInt(Ljava/lang/String;Ljava/lang/String;I)I
    .locals 1
    .parameter "section"
    .parameter "name"
    .parameter "defaultValue"

    .prologue
    .line 199
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2, p3}, Lorg/eclipse/jgit/lib/Config;->getInt(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getInt(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)I
    .locals 8
    .parameter "section"
    .parameter "subsection"
    .parameter "name"
    .parameter "defaultValue"

    .prologue
    .line 217
    int-to-long v4, p4

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/lib/Config;->getLong(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)J

    move-result-wide v6

    .line 218
    .local v6, val:J
    const-wide/32 v0, -0x80000000

    cmp-long v0, v0, v6

    if-gtz v0, :cond_0

    const-wide/32 v0, 0x7fffffff

    cmp-long v0, v6, v0

    if-gtz v0, :cond_0

    .line 219
    long-to-int v0, v6

    return v0

    .line 220
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->integerValueOutOfRange:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object p3, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getLong(Ljava/lang/String;Ljava/lang/String;J)J
    .locals 6
    .parameter "section"
    .parameter "name"
    .parameter "defaultValue"

    .prologue
    .line 236
    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-wide v4, p3

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/lib/Config;->getLong(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getLong(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)J
    .locals 9
    .parameter "section"
    .parameter "subsection"
    .parameter "name"
    .parameter "defaultValue"

    .prologue
    const/4 v8, 0x0

    .line 254
    invoke-virtual {p0, p1, p2, p3}, Lorg/eclipse/jgit/lib/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 255
    .local v4, str:Ljava/lang/String;
    if-nez v4, :cond_1

    .line 280
    .end local p4
    :cond_0
    :goto_0
    return-wide p4

    .line 258
    .restart local p4
    :cond_1
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 259
    .local v2, n:Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_0

    .line 262
    const-wide/16 v0, 0x1

    .line 263
    .local v0, mul:J
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v2, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Lorg/eclipse/jgit/util/StringUtils;->toLowerCase(C)C

    move-result v5

    sparse-switch v5, :sswitch_data_0

    .line 274
    :goto_1
    const-wide/16 v5, 0x1

    cmp-long v5, v0, v5

    if-lez v5, :cond_2

    .line 275
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v2, v8, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 276
    :cond_2
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_0

    .line 280
    :try_start_0
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v5

    mul-long p4, v0, v5

    goto :goto_0

    .line 265
    :sswitch_0
    const-wide/32 v0, 0x40000000

    .line 266
    goto :goto_1

    .line 268
    :sswitch_1
    const-wide/32 v0, 0x100000

    .line 269
    goto :goto_1

    .line 271
    :sswitch_2
    const-wide/16 v0, 0x400

    goto :goto_1

    .line 281
    :catch_0
    move-exception v3

    .line 282
    .local v3, nfe:Ljava/lang/NumberFormatException;
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/internal/JGitText;->invalidIntegerValue:Ljava/lang/String;

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    aput-object p1, v7, v8

    const/4 v8, 0x1

    aput-object p3, v7, v8

    const/4 v8, 0x2

    aput-object v4, v7, v8

    invoke-static {v6, v7}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 263
    nop

    :sswitch_data_0
    .sparse-switch
        0x67 -> :sswitch_0
        0x6b -> :sswitch_2
        0x6d -> :sswitch_1
    .end sparse-switch
.end method

.method public getNames(Ljava/lang/String;)Ljava/util/Set;
    .locals 1
    .parameter "section"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 516
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/lib/Config;->getNames(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getNames(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Set;
    .locals 1
    .parameter "section"
    .parameter "subsection"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 527
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/Config;->getState()Lorg/eclipse/jgit/lib/ConfigSnapshot;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/lib/ConfigSnapshot;->getNames(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getNames(Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/Set;
    .locals 1
    .parameter "section"
    .parameter "subsection"
    .parameter "recursive"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 556
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/Config;->getState()Lorg/eclipse/jgit/lib/ConfigSnapshot;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lorg/eclipse/jgit/lib/ConfigSnapshot;->getNames(Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getNames(Ljava/lang/String;Z)Ljava/util/Set;
    .locals 2
    .parameter "section"
    .parameter "recursive"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 540
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/Config;->getState()Lorg/eclipse/jgit/lib/ConfigSnapshot;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1, p2}, Lorg/eclipse/jgit/lib/ConfigSnapshot;->getNames(Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getSections()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 507
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/Config;->getState()Lorg/eclipse/jgit/lib/ConfigSnapshot;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ConfigSnapshot;->getSections()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "section"
    .parameter "subsection"
    .parameter "name"

    .prologue
    .line 450
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/lib/Config;->getRawString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStringList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 7
    .parameter "section"
    .parameter "subsection"
    .parameter "name"

    .prologue
    const/4 v6, 0x0

    .line 470
    iget-object v4, p0, Lorg/eclipse/jgit/lib/Config;->baseConfig:Lorg/eclipse/jgit/lib/Config;

    if-eqz v4, :cond_0

    .line 471
    iget-object v4, p0, Lorg/eclipse/jgit/lib/Config;->baseConfig:Lorg/eclipse/jgit/lib/Config;

    invoke-virtual {v4, p1, p2, p3}, Lorg/eclipse/jgit/lib/Config;->getStringList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 475
    .local v0, base:[Ljava/lang/String;
    :goto_0
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/lib/Config;->getRawStringList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 476
    .local v3, self:[Ljava/lang/String;
    if-nez v3, :cond_1

    .line 484
    .end local v0           #base:[Ljava/lang/String;
    :goto_1
    return-object v0

    .line 473
    .end local v3           #self:[Ljava/lang/String;
    :cond_0
    sget-object v0, Lorg/eclipse/jgit/lib/Config;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    .restart local v0       #base:[Ljava/lang/String;
    goto :goto_0

    .line 478
    .restart local v3       #self:[Ljava/lang/String;
    :cond_1
    array-length v4, v0

    if-nez v4, :cond_2

    move-object v0, v3

    .line 479
    goto :goto_1

    .line 480
    :cond_2
    array-length v4, v0

    array-length v5, v3

    add-int/2addr v4, v5

    new-array v2, v4, [Ljava/lang/String;

    .line 481
    .local v2, res:[Ljava/lang/String;
    array-length v1, v0

    .line 482
    .local v1, n:I
    invoke-static {v0, v6, v2, v6, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 483
    array-length v4, v3

    invoke-static {v3, v6, v2, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v0, v2

    .line 484
    goto :goto_1
.end method

.method public getSubsections(Ljava/lang/String;)Ljava/util/Set;
    .locals 1
    .parameter "section"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 497
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/Config;->getState()Lorg/eclipse/jgit/lib/ConfigSnapshot;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/lib/ConfigSnapshot;->getSubsections(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method protected notifyUponTransientChanges()Z
    .locals 1

    .prologue
    .line 623
    const/4 v0, 0x1

    return v0
.end method

.method public setBoolean(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1
    .parameter "section"
    .parameter "subsection"
    .parameter "name"
    .parameter "value"

    .prologue
    .line 742
    if-eqz p4, :cond_0

    const-string v0, "true"

    :goto_0
    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/eclipse/jgit/lib/Config;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 743
    return-void

    .line 742
    :cond_0
    const-string v0, "false"

    goto :goto_0
.end method

.method public setEnum(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Enum;)V
    .locals 4
    .parameter "section"
    .parameter "subsection"
    .parameter "name"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Enum",
            "<*>;>(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "TT;)V"
        }
    .end annotation

    .prologue
    .line 768
    .local p4, value:Ljava/lang/Enum;,"TT;"
    instance-of v1, p4, Lorg/eclipse/jgit/lib/Config$ConfigEnum;

    if-eqz v1, :cond_0

    .line 769
    check-cast p4, Lorg/eclipse/jgit/lib/Config$ConfigEnum;

    .end local p4           #value:Ljava/lang/Enum;,"TT;"
    invoke-interface {p4}, Lorg/eclipse/jgit/lib/Config$ConfigEnum;->toConfigValue()Ljava/lang/String;

    move-result-object v0

    .line 772
    .local v0, n:Ljava/lang/String;
    :goto_0
    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/eclipse/jgit/lib/Config;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 773
    return-void

    .line 771
    .end local v0           #n:Ljava/lang/String;
    .restart local p4       #value:Ljava/lang/Enum;,"TT;"
    :cond_0
    invoke-virtual {p4}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x5f

    const/16 v3, 0x20

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    .restart local v0       #n:Ljava/lang/String;
    goto :goto_0
.end method

.method public setInt(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 6
    .parameter "section"
    .parameter "subsection"
    .parameter "name"
    .parameter "value"

    .prologue
    .line 685
    int-to-long v4, p4

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/lib/Config;->setLong(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 686
    return-void
.end method

.method public setLong(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 5
    .parameter "section"
    .parameter "subsection"
    .parameter "name"
    .parameter "value"

    .prologue
    .line 710
    const-wide/32 v1, 0x40000000

    cmp-long v1, p4, v1

    if-ltz v1, :cond_0

    const-wide/32 v1, 0x40000000

    rem-long v1, p4, v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    .line 711
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-wide/32 v2, 0x40000000

    div-long v2, p4, v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " g"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 719
    .local v0, s:Ljava/lang/String;
    :goto_0
    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/eclipse/jgit/lib/Config;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 720
    return-void

    .line 712
    .end local v0           #s:Ljava/lang/String;
    :cond_0
    const-wide/32 v1, 0x100000

    cmp-long v1, p4, v1

    if-ltz v1, :cond_1

    const-wide/32 v1, 0x100000

    rem-long v1, p4, v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    .line 713
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-wide/32 v2, 0x100000

    div-long v2, p4, v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " m"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0       #s:Ljava/lang/String;
    goto :goto_0

    .line 714
    .end local v0           #s:Ljava/lang/String;
    :cond_1
    const-wide/16 v1, 0x400

    cmp-long v1, p4, v1

    if-ltz v1, :cond_2

    const-wide/16 v1, 0x400

    rem-long v1, p4, v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_2

    .line 715
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-wide/16 v2, 0x400

    div-long v2, p4, v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " k"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0       #s:Ljava/lang/String;
    goto :goto_0

    .line 717
    .end local v0           #s:Ljava/lang/String;
    :cond_2
    invoke-static {p4, p5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    .restart local v0       #s:Ljava/lang/String;
    goto :goto_0
.end method

.method public setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "section"
    .parameter "subsection"
    .parameter "name"
    .parameter "value"

    .prologue
    .line 795
    invoke-static {p4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/eclipse/jgit/lib/Config;->setStringList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 797
    return-void
.end method

.method public setStringList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 7
    .parameter "section"
    .parameter "subsection"
    .parameter "name"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 874
    .local p4, values:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/lib/Config;->state:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/lib/ConfigSnapshot;

    .local v1, src:Lorg/eclipse/jgit/lib/ConfigSnapshot;
    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    .line 875
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/lib/Config;->replaceStringList(Lorg/eclipse/jgit/lib/ConfigSnapshot;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lorg/eclipse/jgit/lib/ConfigSnapshot;

    move-result-object v6

    .line 876
    .local v6, res:Lorg/eclipse/jgit/lib/ConfigSnapshot;
    iget-object v0, p0, Lorg/eclipse/jgit/lib/Config;->state:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, v1, v6}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 877
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Config;->notifyUponTransientChanges()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 878
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Config;->fireConfigChangedEvent()V

    .line 879
    :cond_1
    return-void
.end method

.method public toText()Ljava/lang/String;
    .locals 9

    .prologue
    const/16 v8, 0x22

    const/16 v7, 0x20

    .line 977
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 978
    .local v3, out:Ljava/lang/StringBuilder;
    iget-object v5, p0, Lorg/eclipse/jgit/lib/Config;->state:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/lib/ConfigSnapshot;

    iget-object v5, v5, Lorg/eclipse/jgit/lib/ConfigSnapshot;->entryList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/ConfigLine;

    .line 979
    .local v0, e:Lorg/eclipse/jgit/lib/ConfigLine;
    iget-object v5, v0, Lorg/eclipse/jgit/lib/ConfigLine;->prefix:Ljava/lang/String;

    if-eqz v5, :cond_0

    .line 980
    iget-object v5, v0, Lorg/eclipse/jgit/lib/ConfigLine;->prefix:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 981
    :cond_0
    iget-object v5, v0, Lorg/eclipse/jgit/lib/ConfigLine;->section:Ljava/lang/String;

    if-eqz v5, :cond_6

    iget-object v5, v0, Lorg/eclipse/jgit/lib/ConfigLine;->name:Ljava/lang/String;

    if-nez v5, :cond_6

    .line 982
    const/16 v5, 0x5b

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 983
    iget-object v5, v0, Lorg/eclipse/jgit/lib/ConfigLine;->section:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 984
    iget-object v5, v0, Lorg/eclipse/jgit/lib/ConfigLine;->subsection:Ljava/lang/String;

    if-eqz v5, :cond_2

    .line 985
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 986
    iget-object v5, v0, Lorg/eclipse/jgit/lib/ConfigLine;->subsection:Ljava/lang/String;

    invoke-static {v5}, Lorg/eclipse/jgit/lib/Config;->escapeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 988
    .local v1, escaped:Ljava/lang/String;
    const-string v5, "\""

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    const-string v5, "\""

    invoke-virtual {v1, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    const/4 v4, 0x1

    .line 990
    .local v4, quoted:Z
    :goto_1
    if-nez v4, :cond_1

    .line 991
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 992
    :cond_1
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 993
    if-nez v4, :cond_2

    .line 994
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 996
    .end local v1           #escaped:Ljava/lang/String;
    .end local v4           #quoted:Z
    :cond_2
    const/16 v5, 0x5d

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1011
    :cond_3
    :goto_2
    iget-object v5, v0, Lorg/eclipse/jgit/lib/ConfigLine;->suffix:Ljava/lang/String;

    if-eqz v5, :cond_4

    .line 1012
    iget-object v5, v0, Lorg/eclipse/jgit/lib/ConfigLine;->suffix:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1013
    :cond_4
    const/16 v5, 0xa

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 988
    .restart local v1       #escaped:Ljava/lang/String;
    :cond_5
    const/4 v4, 0x0

    goto :goto_1

    .line 997
    .end local v1           #escaped:Ljava/lang/String;
    :cond_6
    iget-object v5, v0, Lorg/eclipse/jgit/lib/ConfigLine;->section:Ljava/lang/String;

    if-eqz v5, :cond_3

    iget-object v5, v0, Lorg/eclipse/jgit/lib/ConfigLine;->name:Ljava/lang/String;

    if-eqz v5, :cond_3

    .line 998
    iget-object v5, v0, Lorg/eclipse/jgit/lib/ConfigLine;->prefix:Ljava/lang/String;

    if-eqz v5, :cond_7

    const-string v5, ""

    iget-object v6, v0, Lorg/eclipse/jgit/lib/ConfigLine;->prefix:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 999
    :cond_7
    const/16 v5, 0x9

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1000
    :cond_8
    iget-object v5, v0, Lorg/eclipse/jgit/lib/ConfigLine;->name:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1001
    sget-object v5, Lorg/eclipse/jgit/lib/Config;->MAGIC_EMPTY_VALUE:Ljava/lang/String;

    iget-object v6, v0, Lorg/eclipse/jgit/lib/ConfigLine;->value:Ljava/lang/String;

    if-eq v5, v6, :cond_9

    .line 1002
    const-string v5, " ="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1003
    iget-object v5, v0, Lorg/eclipse/jgit/lib/ConfigLine;->value:Ljava/lang/String;

    if-eqz v5, :cond_9

    .line 1004
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1005
    iget-object v5, v0, Lorg/eclipse/jgit/lib/ConfigLine;->value:Ljava/lang/String;

    invoke-static {v5}, Lorg/eclipse/jgit/lib/Config;->escapeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1008
    :cond_9
    iget-object v5, v0, Lorg/eclipse/jgit/lib/ConfigLine;->suffix:Ljava/lang/String;

    if-eqz v5, :cond_3

    .line 1009
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 1015
    .end local v0           #e:Lorg/eclipse/jgit/lib/ConfigLine;
    :cond_a
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public uncache(Lorg/eclipse/jgit/lib/Config$SectionParser;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/Config$SectionParser",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 593
    .local p1, parser:Lorg/eclipse/jgit/lib/Config$SectionParser;,"Lorg/eclipse/jgit/lib/Config$SectionParser<*>;"
    iget-object v0, p0, Lorg/eclipse/jgit/lib/Config;->state:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/ConfigSnapshot;

    iget-object v0, v0, Lorg/eclipse/jgit/lib/ConfigSnapshot;->cache:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 594
    return-void
.end method

.method public unset(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "section"
    .parameter "subsection"
    .parameter "name"

    .prologue
    .line 811
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/eclipse/jgit/lib/Config;->setStringList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 813
    return-void
.end method

.method public unsetSection(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .parameter "section"
    .parameter "subsection"

    .prologue
    .line 826
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/lib/Config;->state:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/lib/ConfigSnapshot;

    .line 827
    .local v1, src:Lorg/eclipse/jgit/lib/ConfigSnapshot;
    invoke-direct {p0, v1, p1, p2}, Lorg/eclipse/jgit/lib/Config;->unsetSection(Lorg/eclipse/jgit/lib/ConfigSnapshot;Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/lib/ConfigSnapshot;

    move-result-object v0

    .line 828
    .local v0, res:Lorg/eclipse/jgit/lib/ConfigSnapshot;
    iget-object v2, p0, Lorg/eclipse/jgit/lib/Config;->state:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2, v1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 829
    return-void
.end method
